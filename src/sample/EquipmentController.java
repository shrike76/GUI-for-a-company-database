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

public class EquipmentController implements Initializable {
    public TableView tv1;
    public Button ButtonExit;
    public TextField EquipmentTypeTextField;
    public TextField EquipmentNameTextField;
    public CheckBox IsActiveCheckbox;
    public TextField EquipmentPriceTextField;
    public ComboBox EquipmentConditionComboBox;
    public Button EquipmentConditionButton;

    private String _vendorid;
    final String AWS = "jdbc:sqlserver://CoT-CIS3365-18:1433;databaseName=IceCreamDB;user=IceCream;password=Vanilla";
    Connection conn;
    public ObservableList<ObservableList> data;

    public void initialize(URL url, ResourceBundle resourceBundle) {
        try {
            conn = DriverManager.getConnection(AWS);
            System.out.println("CONNECTED");
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM EquipmentCondition");
            while (rs.next()) {
                EquipmentConditionComboBox.getItems().addAll(rs.getString("equipment_condition") +"-"+ rs.getString("equipmentconditionid"));
            }
        } catch (Exception ex) {
            System.out.println("ERROR: " + ex.getMessage());
        }

    }

    public void Initdata(String vendorid){
        _vendorid = vendorid;
        view();
    }

    public void view() {
        try {
            data = FXCollections.observableArrayList();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT E.equipmentid, E.vendorid, E.equipment_type, E.equipment_name, E.equipment_price, EC.equipment_condition, E.Active FROM Equipment E LEFT JOIN EquipmentCondition EC\n" +
                    "ON E.equipmentconditionid = EC.equipmentconditionid\n" +
                    "WHERE E.vendorid = " + _vendorid);
            System.out.println(_vendorid);
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
            data = FXCollections.observableArrayList();
            Statement stmt = conn.createStatement();

            PreparedStatement pstmt2 = conn.prepareStatement("INSERT INTO Equipment (vendorid, equipmentconditionid, equipment_type, equipment_name, equipment_price, Active) Values (?,?,?,?,?,?)");
            pstmt2.setInt(1, Integer.parseInt(_vendorid));
            pstmt2.setInt(2, GetID(EquipmentConditionComboBox.getValue().toString()));
            pstmt2.setString(3, EquipmentTypeTextField.getText());
            pstmt2.setString(4, EquipmentNameTextField.getText());
            pstmt2.setBigDecimal(5, new BigDecimal(EquipmentPriceTextField.getText()));
            pstmt2.setString(6, IsActiveCheckbox.isSelected() ? "true":"false");
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

        //adminid
        String ID = Tablename.get(0);

        PreparedStatement pstmt = conn.prepareStatement("UPDATE Equipment SET equipment_type = ?,equipment_name = ?, equipment_price = ?, equipmentconditionid = ?, Active = ? WHERE equipmentid = " + ID );
        pstmt.setString(1, EquipmentTypeTextField.getText());
        pstmt.setString(2, EquipmentNameTextField.getText());
        pstmt.setBigDecimal(3, new BigDecimal(EquipmentPriceTextField.getText()));
        pstmt.setInt(4, GetID(EquipmentConditionComboBox.getValue().toString()));
        pstmt.setString(5, IsActiveCheckbox.isSelected() ? "true":"false");
        pstmt.executeUpdate();

        view();
    }
    
    private int GetID(String Name){
        String number = Name.substring(Name.lastIndexOf('-')+1);
        int a = Integer.parseInt(number);
        return a;
    }
    
    public void Exit(ActionEvent actionEvent) throws Exception{
        Parent root = FXMLLoader.load(getClass().getResource("Vendor.fxml"));
        Scene scene = new Scene(root);
        Stage stage = (Stage) ButtonExit.getScene().getWindow();
        stage.setScene(scene);
    }
}
