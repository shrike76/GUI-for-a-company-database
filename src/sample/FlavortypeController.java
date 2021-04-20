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

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URL;
import java.sql.*;
import java.util.ArrayList;
import java.util.ResourceBundle;

public class FlavortypeController implements Initializable {
    public TableView tv1;
    public TextField FlavorTypeTextfield;
    public TextField PriceTextfield;
    public CheckBox IsActiveCheckbox;
    public Button ButtonExit;

    Connection conn;
    final String AWS = "jdbc:sqlserver://CoT-CIS3365-18:1433;databaseName=IceCreamDB;user=IceCream;password=Vanilla";
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

    //code to view table into a listview. can be replicated everywhere.
    public void view() {
        try {
            data = FXCollections.observableArrayList();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT FT.flavortypeid, FT.flavor_type, FT.flavorpriceid, FP.flavor_price, FT.Active FROM FlavorType FT LEFT JOIN FlavorPrice FP\n" +
                    "ON FT.flavorpriceid = FP.flavorpriceid");
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
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO FlavorPrice (flavor_price) Values (?)");
            pstmt.setBigDecimal(1, new BigDecimal(PriceTextfield.getText()));
            pstmt.executeUpdate();

            ResultSet rs = stmt.executeQuery("SELECT MAX(flavorpriceid) ID FROM FlavorPrice");
            rs.next();
            int ID = rs.getInt("ID");

            PreparedStatement pstmt2 = conn.prepareStatement("INSERT INTO FlavorType (flavorpriceid, flavor_type, Active) Values (?, ?, ?)");
            pstmt2.setInt(1, ID);
            pstmt2.setString(2, FlavorTypeTextfield.getText());
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
        Statement stmt = conn.createStatement();

        //flavorpriceid
        String ID = Tablename.get(0);

        PreparedStatement pstmt2 = conn.prepareStatement("INSERT INTO FlavorPrice (flavor_price) Values (?)");
        pstmt2.setBigDecimal(1, new BigDecimal(PriceTextfield.getText()));
        pstmt2.executeUpdate();

        ResultSet rs = stmt.executeQuery("SELECT MAX(flavorpriceid) ID FROM FlavorPrice");
        rs.next();
        int ID1 = rs.getInt("ID");

        PreparedStatement pstmt = conn.prepareStatement("UPDATE FlavorType SET flavor_type = ?,flavorpriceid = ?, Active = ? WHERE flavortypeid = " + ID );
        pstmt.setString(1, FlavorTypeTextfield.getText());
        pstmt.setInt(2, ID1);
        pstmt.setBoolean(3, IsActiveCheckbox.isSelected());
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