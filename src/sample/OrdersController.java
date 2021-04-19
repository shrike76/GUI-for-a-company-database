package sample;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.stage.Stage;
import javafx.util.Callback;

import java.math.BigDecimal;
import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;
import java.util.Date;

public class OrdersController implements Initializable {
    public TableView tv1;
    public Button ButtonExit;
    public CheckBox IsActiveCheckbox;
    public ComboBox FlavorComboBox;
    public ComboBox SizeComboBox;
    public ComboBox ToppingComboBox;
    public ComboBox OrderStatusComboBox;
    public ComboBox BillStatusComboBox;

    private String _customerid;
    final String AWS = "jdbc:sqlserver://CoT-CIS3365-18:1433;databaseName=IceCreamDB;user=IceCream;password=Vanilla";
    Connection conn;
    public ObservableList<ObservableList> data;

    public void initialize(URL url, ResourceBundle resourceBundle) {
        try {
            conn = DriverManager.getConnection(AWS);
            System.out.println("CONNECTED");

            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM FlavorType WHERE Active = 1");
            while (rs.next()) {
                FlavorComboBox.getItems().addAll(rs.getString("flavor_type") +"-"+ rs.getString("flavortypeid"));
            }

            //sets the id and column to the combo box
            ResultSet rs2 = stmt.executeQuery("SELECT * FROM Size WHERE Active = 1");
            while (rs2.next()) {
                SizeComboBox.getItems().addAll(rs2.getString("size") +"-"+ rs2.getString("sizeid"));
            }

            //sets the id and column to the combo box
            ResultSet rs3 = stmt.executeQuery("SELECT * FROM Topping WHERE Active = 1");
            while (rs3.next()) {
                ToppingComboBox.getItems().addAll(rs3.getString("topping") +"-"+ rs3.getString("toppingid"));
            }

            //sets the id and column to the combo box
            ResultSet rs4 = stmt.executeQuery("SELECT * FROM OrderStatus");
            while (rs4.next()) {
                OrderStatusComboBox.getItems().addAll(rs4.getString("order_status") +"-"+ rs4.getString("orderstatusid"));
            }

            ResultSet rs5 = stmt.executeQuery("SELECT * FROM BillStatus");
            while (rs5.next()) {
                BillStatusComboBox.getItems().addAll(rs5.getString("bill_status") +"-"+ rs5.getString("billstatusid"));
            }
        } catch (Exception ex) {
            System.out.println("ERROR: " + ex.getMessage());
        }

    }

    public void Initdata(String customerid){
        _customerid = customerid;
        view();
    }

    public void view() {
        try {
            data = FXCollections.observableArrayList();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT O.orderid, O.customerid, O.icecreamid, B.billid, Ft.flavor_type, S.size, T.topping, OS.order_status, O.Active OrderActive, B.total_bill, B.bill_date, BS.bill_status\n" +
                    "FROM Orders O\n" +
                    "    LEFT JOIN IceCream IC ON O.icecreamid = IC.icecreamid\n" +
                    "        LEFT JOIN FlavorType FT ON IC.flavortypeid = FT.flavortypeid\n" +
                    "        LEFT JOIN Size S ON IC.sizeid = S.sizeid\n" +
                    "        LEFT JOIN Topping T ON IC.toppingid = T.toppingid\n" +
                    "    LEFT JOIN OrderStatus OS ON O.orderstatusid = OS.orderstatusid\n" +
                    "    LEFT JOIN Bill B ON O.orderid = B.orderid\n" +
                    "        LEFT JOIN BillStatus BS ON B.billstatusid = BS.billstatusid\n" +
                    "WHERE O.customerid =" + _customerid);
            //System.out.println(_customerid);
            if (tv1.getItems().isEmpty()) {
                for (int i = 0; i < rs.getMetaData().getColumnCount(); i++) {
                    //We are using non property style for making dynamic table. Borrowed from a CIS 3368 assignment by Colton Weber (the guy writing this code) https://github.com/shrike76/Student-Database-using-Java-MySQL-and-AWS
                    final int j = i;
                    TableColumn col = new TableColumn(rs.getMetaData().getColumnName(i + 1));
                    col.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<ObservableList, String>, ObservableValue<String>>() {
                        public ObservableValue<String> call(TableColumn.CellDataFeatures<ObservableList, String> param) {
                            return new SimpleStringProperty(param.getValue().get(j).toString());
                        }
                    });
                    tv1.getColumns().addAll(col);
                    //System.out.println("Column [" + i + "] ");
                }
            }

            while (rs.next()) {
                //Iterate Row
                ObservableList<String> row = FXCollections.observableArrayList();
                for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
                    //Iterate Column
                    String value = rs.getString(i);
                    if (rs.wasNull()) {
                        value = ""; // set it to empty string as you desire.
                    }
                    row.add(value);
                }
                //System.out.println("Row [1] added " + row);
                data.add(row);

            }
            tv1.setItems(data);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error on Building Data");
        }
    }

    private int GetID(String Name){
        String number = Name.substring(Name.lastIndexOf('-')+1);
        int a = Integer.parseInt(number);
        return a;
    }

    public void Add() {
        try {
            //System.out.println(GetID(CountryComboBox.getValue().toString()));

            //data = FXCollections.observableArrayList();

            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO IceCream (flavortypeid, sizeid, toppingid)\n" +
                    "Values (?, ?, ?)");

            pstmt.setInt(1, GetID(FlavorComboBox.getValue().toString()));
            pstmt.setInt(2, GetID(SizeComboBox.getValue().toString()));
            pstmt.setInt(3, GetID(ToppingComboBox.getValue().toString()));

            pstmt.executeUpdate();

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT MAX(icecreamid) ID FROM IceCream");
            rs.next();
            int ID = rs.getInt("ID");

            PreparedStatement pstmt2 = conn.prepareStatement("INSERT INTO Orders (customerid, icecreamid, orderstatusid, Active)\n" +
                    "Values (?, ?, ?, ?)");
            pstmt2.setInt(1, Integer.parseInt(_customerid));
            pstmt2.setInt(2, ID);
            pstmt2.setInt(3, GetID(OrderStatusComboBox.getValue().toString()));
            pstmt2.setString(4, IsActiveCheckbox.isSelected() ? "true":"false");
            pstmt2.executeUpdate();

            ResultSet rs2 = stmt.executeQuery("SELECT MAX(orderid) ID FROM Orders");
            rs2.next();
            int ID2 = rs2.getInt("ID");

            //combines the flavor, size, and topping prices that are selected and sums it up.


            PreparedStatement pstmt3 = conn.prepareStatement("INSERT INTO BILL(orderid, billstatusid, total_bill, bill_date) Values (?,?,?,?)");
            pstmt3.setInt(1, ID2);
            pstmt3.setInt(2, GetID(BillStatusComboBox.getValue().toString()));
            pstmt3.setBigDecimal(3, GetTotalBill(GetID(FlavorComboBox.getValue().toString()),GetID(SizeComboBox.getValue().toString()),GetID(ToppingComboBox.getValue().toString())));
            pstmt3.setDate(4, java.sql.Date.valueOf(java.time.LocalDate.now()));

            pstmt3.executeUpdate();

            view();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error on Building Data");
        }
    }


    public BigDecimal GetTotalBill(int flavortypeid, int sizepriceid, int toppingpriceid) throws SQLException {

        PreparedStatement pstmt = conn.prepareStatement("SELECT SUM(price) total FROM (\n" +
                "    SELECT flavor_price price\n" +
                "    FROM FlavorPrice FP INNER JOIN FlavorType FT ON FP.flavorpriceid = FT.flavorpriceid\n" +
                "    WHERE FT.flavortypeid = ?\n" +
                "    UNION ALL\n" +
                "    SELECT size_price price\n" +
                "    FROM SizePrice SP INNER JOIN Size S ON SP.sizepriceid = S.sizepriceid\n" +
                "    WHERE S.sizeid = ?\n" +
                "    UNION ALL\n" +
                "    SELECT topping_price price\n" +
                "    FROM ToppingPrice TP INNER JOIN Topping T ON TP.toppingpriceid = T.toppingpriceid\n" +
                "    WHERE T.toppingid = ?\n" +
                ") A");
        pstmt.setInt(1, flavortypeid);
        pstmt.setInt(2, sizepriceid);
        pstmt.setInt(3, toppingpriceid);


        ResultSet rs = pstmt.executeQuery();
        rs.next();
        BigDecimal amount = rs.getBigDecimal("total");
        return amount;
    }

    public void Update(ActionEvent actionEvent) throws SQLException {
        ObservableList<String> Tablename = (ObservableList<String>) tv1.getSelectionModel().getSelectedItem();

        //orderid
        String id1 = Tablename.get(0);
        //icecreamid
        String id2 = Tablename.get(2);
        //billid
        String id3 = Tablename.get(3);

        if (!FlavorComboBox.getSelectionModel().isEmpty()) {
            PreparedStatement pstmt3 = conn.prepareStatement("UPDATE IceCream SET flavortypeid = ? WHERE icecreamid = " + id2);
            pstmt3.setInt(1, GetID(FlavorComboBox.getValue().toString()));
            pstmt3.executeUpdate();
        }

        if (!SizeComboBox.getSelectionModel().isEmpty()) {
            PreparedStatement pstmt4 = conn.prepareStatement("UPDATE IceCream SET sizeid = ? WHERE icecreamid = " + id2);
            pstmt4.setInt(1, GetID(SizeComboBox.getValue().toString()));
            pstmt4.executeUpdate();
        }

        if (!ToppingComboBox.getSelectionModel().isEmpty()) {
            PreparedStatement pstmt5 = conn.prepareStatement("UPDATE IceCream SET toppingid = ? WHERE icecreamid = " + id2);
            pstmt5.setInt(1, GetID(ToppingComboBox.getValue().toString()));
            pstmt5.executeUpdate();
        }

        if (!OrderStatusComboBox.getSelectionModel().isEmpty()) {
            PreparedStatement pstmt6 = conn.prepareStatement("UPDATE Orders SET orderstatusid = ? WHERE orderid = " + id1);
            pstmt6.setInt(1, GetID(OrderStatusComboBox.getValue().toString()));
            pstmt6.executeUpdate();
        }

        if (!BillStatusComboBox.getSelectionModel().isEmpty()) {
            PreparedStatement pstmt8 = conn.prepareStatement("UPDATE Bill SET billstatusid = ? WHERE billid = " + id3);
            pstmt8.setInt(1, GetID(BillStatusComboBox.getValue().toString()));
            pstmt8.executeUpdate();
        }

        if (!FlavorComboBox.getSelectionModel().isEmpty() && !SizeComboBox.getSelectionModel().isEmpty() && !ToppingComboBox.getSelectionModel().isEmpty()) {
            PreparedStatement pstmt7 = conn.prepareStatement("UPDATE Bill SET total_bill = ?, bill_date = ? WHERE billid = " + id3);
            pstmt7.setBigDecimal(1, GetTotalBill(GetID(FlavorComboBox.getValue().toString()), GetID(SizeComboBox.getValue().toString()), GetID(ToppingComboBox.getValue().toString())));
            pstmt7.setDate(2, java.sql.Date.valueOf(java.time.LocalDate.now()));
            pstmt7.executeUpdate();
        }

        PreparedStatement pstmt9 = conn.prepareStatement("UPDATE Orders SET Active = ? WHERE orderid = " + id1);
        pstmt9.setString(1, IsActiveCheckbox.isSelected() ? "true":"false");
        pstmt9.executeUpdate();
        view();
    }

    public void Exit(ActionEvent actionEvent) throws Exception{
        Parent root = FXMLLoader.load(getClass().getResource("Customer.fxml"));
        Scene scene = new Scene(root);
        Stage stage = (Stage) ButtonExit.getScene().getWindow();
        stage.setScene(scene);
    }
}
