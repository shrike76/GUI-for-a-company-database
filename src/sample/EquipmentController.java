package sample;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.util.Callback;

import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;

public class EquipmentController implements Initializable {
    public TableView tv1;
    public Button ButtonExit;
    public TextField ToppingTextField;
    public TextField ToppingPriceTextField;
    public CheckBox IsActiveCheckbox;
    public TextField ToppingPriceTextField1;
    public ComboBox EquipmentConditionComboBox;

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

    public void Add(ActionEvent actionEvent) {
    }

    public void Update(ActionEvent actionEvent) {
    }

    public void Exit(ActionEvent actionEvent) {
    }
}
