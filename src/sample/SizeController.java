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

public class SizeController implements Initializable {
    public Button ButtonExit;
    public TextField SizeTextfield;
    public TextField SizePriceTextfield;
    public CheckBox IsActiveCheckbox;
    public TableView tv1;

    final String AWS = "jdbc:sqlserver://CoT-CIS3365-18:1433;databaseName=IceCreamDB;user=IceCream;password=Vanilla";
    Connection conn;
    public ObservableList<ObservableList> data;

    public void initialize(URL url, ResourceBundle resourceBundle) {
        try {
            conn = DriverManager.getConnection(AWS);
            System.out.println("CONNECTED");
            view();
        } catch (Exception ex) {
            System.out.println("ERROR: " + ex.getMessage());
        }
    }

    public void view() {
        try {
            data = FXCollections.observableArrayList();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT S.sizeid, S.sizepriceid, S.size, SP.size_price, S.Active FROM Size S LEFT JOIN SizePrice SP\n" +
                    "ON S.sizepriceid = SP.sizepriceid");
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
                    System.out.println("Column [" + i + "] ");
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
                System.out.println("Row [1] added " + row);
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
            data = FXCollections.observableArrayList();
            Statement stmt = conn.createStatement();
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO SizePrice (size_price) Values (?)");

            pstmt.setBigDecimal(1, new BigDecimal(SizePriceTextfield.getText()));
            pstmt.executeUpdate();

            ResultSet rs = stmt.executeQuery("SELECT MAX(sizepriceid) ID FROM SizePrice");
            rs.next();
            int ID = rs.getInt("ID");

            PreparedStatement pstmt2 = conn.prepareStatement("INSERT INTO Size (sizepriceid, size, Active) Values (?, ?, ?)");
            pstmt2.setInt(1, ID);
            pstmt2.setString(2, SizeTextfield.getText());
            pstmt2.setBoolean(3, IsActiveCheckbox.isSelected());
            pstmt2.executeUpdate();
            view();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error on Building Data");
        }
    }

    public void Update(ActionEvent actionEvent) throws SQLException {
        ObservableList<String> Tablename = (ObservableList<String>) tv1.getSelectionModel().getSelectedItem();

        String ID1 = Tablename.get(0);
        String ID2 = Tablename.get(2);

        PreparedStatement pstmt = conn.prepareStatement("UPDATE Size SET size = ?, Active = ? WHERE sizeid = " + ID1 );
        pstmt.setString(1, SizeTextfield.getText());
        pstmt.setBoolean(2, IsActiveCheckbox.isSelected());
        pstmt.executeUpdate();

        PreparedStatement pstmt2 = conn.prepareStatement("UPDATE Size SET size_price = ? WHERE sizepriceid = " + ID2);
        pstmt2.setBigDecimal(1, new BigDecimal(SizePriceTextfield.getText()));
        pstmt.executeUpdate();
        view();
    }

    public void Exit(ActionEvent actionEvent) throws Exception{
        Parent root = FXMLLoader.load(getClass().getResource("mainmenu.fxml"));
        Scene scene = new Scene(root);
        Stage stage = (Stage) ButtonExit.getScene().getWindow();
        stage.setScene(scene);
    }

}
