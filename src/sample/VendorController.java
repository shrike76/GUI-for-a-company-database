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
import javafx.util.StringConverter;

import java.math.BigDecimal;
import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;

public class VendorController implements Initializable {

    final String AWS = "jdbc:sqlserver://CoT-CIS3365-18:1433;databaseName=IceCreamDB;user=IceCream;password=Vanilla";
    public TextField FlavorTypeTextfield;
    public TextField PriceTextfield;
    public CheckBox IsActiveCheckbox;
    public TableView tv1;
    public Button ButtonExit;
    public TextField FirstNameTextField;
    public TextField LastNameTextField;
    public TextField PhoneTextField;
    public TextField EmailTextField;
    public ComboBox CountryComboBox;
    public ComboBox StateComboBox;
    public ComboBox CityComboBox;
    public ComboBox ZipcodeComboBox;
    public ComboBox StreetComboBox;
    public Button EquipmentButton;

    Connection conn;
    public ObservableList<ObservableList> data;
    
    public void initialize(URL url, ResourceBundle resourceBundle) {
        try {
            conn = DriverManager.getConnection(AWS);
            System.out.println("CONNECTED");
            view();
            Statement stmt = conn.createStatement();

            //sets the id and column to the combo box
            ResultSet rs = stmt.executeQuery("SELECT * FROM CountryList");
            while (rs.next()) {
                CountryComboBox.getItems().addAll(rs.getString("country_name") +"-"+ rs.getString("countryid"));
            }

            ResultSet rs2 = stmt.executeQuery("SELECT * FROM StateList");
            while (rs2.next()) {
                System.out.println(rs2);
                StateComboBox.getItems().addAll(rs2.getString("state_name") +"-"+ rs2.getString("stateid"));
            }

            ResultSet rs3 = stmt.executeQuery("SELECT * FROM CityList");
            while (rs3.next()) {
                CityComboBox.getItems().addAll(rs3.getString("city_name") +"-"+ rs3.getString("cityid"));
            }

            ResultSet rs4 = stmt.executeQuery("SELECT * FROM ZipcodeList");
            while (rs4.next()) {
                ZipcodeComboBox.getItems().addAll(rs4.getString("zipcode_number") +"-"+ rs4.getString("zipcodeid"));
            }

            ResultSet rs5 = stmt.executeQuery("SELECT * FROM Streetlist");
            while (rs5.next()) {
                StreetComboBox.getItems().addAll(rs5.getString("street_name") +"-"+ rs5.getString("streetid"));
            }

        } catch (Exception ex) {
            System.out.println("ERROR: " + ex.getMessage());
        }
    }

    //code to view table into a listview. can be replicated everywhere.
    public void view() {
        try {
            data = FXCollections.observableArrayList();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT V.vendorid,V.first_name,V.last_name,V.phone,V.email,V.vendoraddressid,CO.countryid,CO.country_name,S.stateid,S.state_name,C.cityid,C.city_name,Z.zipcodeid,Z.zipcode_number,SL.streetid,SL.street_name, VS.vendor_status Active\n" +
                    "FROM Vendor V LEFT JOIN VendorAddress VA\n" +
                    "ON V.vendoraddressid = VA.vendoraddressid\n" +
                    "    LEFT JOIN CountryList CO ON VA.countryid = CO.countryid\n" +
                    "    LEFT JOIN StateList S ON VA.stateid = S.stateid\n" +
                    "    LEFT JOIN CityList C ON VA.cityid = C.cityid\n" +
                    "    LEFT JOIN ZipcodeList Z ON VA.zipcodeid = Z.zipcodeid\n" +
                    "    LEFT JOIN StreetList SL ON VA.streetid = SL.streetid\n" +
                    "    LEFT JOIN VendorStatus VS ON V.vendorid = VS.vendorid");
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

    public void Add() {
        try {
            //System.out.println(GetID(CountryComboBox.getValue().toString()));

            data = FXCollections.observableArrayList();
            Statement stmt = conn.createStatement();
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO VendorAddress (countryid, stateid, cityid, zipcodeid, streetid)\n" +
                    "Values (?, ?, ?, ?, ?)");

            pstmt.setInt(1, GetID(CountryComboBox.getValue().toString()));
            pstmt.setInt(2, GetID(StateComboBox.getValue().toString()));
            pstmt.setInt(3, GetID(CityComboBox.getValue().toString()));
            pstmt.setInt(4, GetID(ZipcodeComboBox.getValue().toString()));
            pstmt.setInt(5, GetID(StreetComboBox.getValue().toString()));

            pstmt.executeUpdate();

            ResultSet rs = stmt.executeQuery("SELECT MAX(vendoraddressid) ID FROM VendorAddress");
            rs.next();
            int ID = rs.getInt("ID");

            PreparedStatement pstmt2 = conn.prepareStatement("INSERT INTO Vendor (vendoraddressid, first_name, last_name, phone, email)\n" +
                    "Values (?, ?, ?, ?, ?)");
            pstmt2.setInt(1, ID);
            pstmt2.setString(2, FirstNameTextField.getText());
            pstmt2.setString(3, LastNameTextField.getText());
            pstmt2.setString(4, PhoneTextField.getText());
            pstmt2.setString(5, EmailTextField.getText());
            pstmt2.executeUpdate();

            ResultSet rs2 = stmt.executeQuery("SELECT MAX(vendorid) ID FROM Vendor");
            rs2.next();
            int ID2 = rs2.getInt("ID");
            PreparedStatement pstmt3 = conn.prepareStatement("INSERT INTO VendorStatus(vendorid, vendor_status) Values (?,?)");
            pstmt3.setInt(1, ID2);
            pstmt3.setString(2, IsActiveCheckbox.isSelected() ? "true":"false");
            pstmt3.executeUpdate();

            view();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error on Building Data");
        }
    }


    public void Update(ActionEvent actionEvent) throws SQLException {
        ObservableList<String> Tablename = (ObservableList<String>) tv1.getSelectionModel().getSelectedItem();

        //vendorid
        String id1 = Tablename.get(0);
        //vendoraddressid
        String id2 = Tablename.get(5);


        PreparedStatement pstmt = conn.prepareStatement("UPDATE Vendor SET first_name = ?,last_name = ?,phone = ?,email = ? WHERE vendorid = " + id1 );
        pstmt.setString(1, FirstNameTextField.getText());
        pstmt.setString(2, LastNameTextField.getText());
        pstmt.setString(3, PhoneTextField.getText());
        pstmt.setString(4, EmailTextField.getText());
        pstmt.executeUpdate();

        if (!CountryComboBox.getSelectionModel().isEmpty()) {
            PreparedStatement pstmt2 = conn.prepareStatement("UPDATE VendorAddress SET countryid = ? WHERE vendoraddressid = " + id2);
            pstmt2.setInt(1, GetID(CountryComboBox.getValue().toString()));
            pstmt2.executeUpdate();
        }

        if (!StateComboBox.getSelectionModel().isEmpty()) {
            PreparedStatement pstmt3 = conn.prepareStatement("UPDATE VendorAddress SET stateid = ? WHERE vendoraddressid = " + id2);
            pstmt3.setInt(1, GetID(StateComboBox.getValue().toString()));
            pstmt3.executeUpdate();
        }

        if (!CityComboBox.getSelectionModel().isEmpty()) {
            PreparedStatement pstmt4 = conn.prepareStatement("UPDATE VendorAddress SET cityid = ? WHERE vendoraddressid = " + id2);
            pstmt4.setInt(1, GetID(CityComboBox.getValue().toString()));
            pstmt4.executeUpdate();
        }

        if (!ZipcodeComboBox.getSelectionModel().isEmpty()) {
            PreparedStatement pstmt5 = conn.prepareStatement("UPDATE VendorAddress SET zipcodeid = ? WHERE vendoraddressid = " + id2);
            pstmt5.setInt(1, GetID(ZipcodeComboBox.getValue().toString()));
            pstmt5.executeUpdate();
        }

        if (!StreetComboBox.getSelectionModel().isEmpty()) {
            PreparedStatement pstmt6 = conn.prepareStatement("UPDATE VendorAddress SET streetid = ? WHERE vendoraddressid = " + id2);
            pstmt6.setInt(1, GetID(StreetComboBox.getValue().toString()));
            pstmt6.executeUpdate();
        }

        PreparedStatement pstmt7 = conn.prepareStatement("UPDATE VendorStatus SET vendor_status = ? WHERE vendorid = " + id1);
        pstmt7.setString(1, IsActiveCheckbox.isSelected() ? "true":"false");
        pstmt7.executeUpdate();

        view();
    }

    public void Exit(ActionEvent actionEvent) throws Exception{
        Parent root = FXMLLoader.load(getClass().getResource("mainmenu.fxml"));
        Scene scene = new Scene(root);
        Stage stage = (Stage) ButtonExit.getScene().getWindow();
        stage.setScene(scene);
    }

    public void ManageEquipmentSwitch(ActionEvent actionEvent) throws Exception{
        ObservableList<String> Tablename = (ObservableList<String>) tv1.getSelectionModel().getSelectedItem();

        //vendorid
        String id1 = Tablename.get(0);
        FXMLLoader loader = new FXMLLoader(getClass().getResource("Equipment.fxml"));
        Parent root = loader.load();
        EquipmentController eq = loader.getController();
        eq.Initdata(id1);
        Scene scene = new Scene(root);
        Stage stage = (Stage) ButtonExit.getScene().getWindow();
        stage.setScene(scene);
    }

    private int GetID(String Name){
        String number = Name.substring(Name.lastIndexOf('-')+1);
        int a = Integer.parseInt(number);
        return a;
    }

}
