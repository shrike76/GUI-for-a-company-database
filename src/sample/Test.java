package sample;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.util.Callback;

import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;

public class Test implements Initializable {
    public TableView tv1;
    final String AWS = "jdbc:sqlserver://CoT-CIS3365-18:1433;databaseName=IceCreamDB;user=IceCream;password=Vanilla";
    public ObservableList<ObservableList> data;
    Connection conn;
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
            ResultSet rs = stmt.executeQuery("SELECT FT.flavortypeid, FT.flavor_type, FT.flavorpriceid, FP.flavor_price FROM FlavorType FT LEFT JOIN FlavorPrice FP\n" +
                    "ON FT.flavorpriceid = FP.flavorpriceid");
            if (tv1.getItems().isEmpty()) {
                for (int i = 0; i < rs.getMetaData().getColumnCount(); i++) {
                    //We are using non property style for making dynamic table
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
}