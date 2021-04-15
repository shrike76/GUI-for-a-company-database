package sample;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;

public class MainmenuController implements Initializable {


    final String AWS = "jdbc:sqlserver://CoT-CIS3365-18:1433;databaseName=IceCreamDB;user=IceCream;password=Vanilla";
    @FXML
    ListView<String> ListTable;

    ObservableList<String> items = FXCollections.observableArrayList();

    //displays all table names of database on initialize
    public void initialize(URL url, ResourceBundle resourceBundle) {
        try {
            Connection conn = DriverManager.getConnection(AWS);
            Statement stmt = conn.createStatement();
            System.out.println("CONNECTED");
            ResultSet rs;
            rs = stmt.executeQuery("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_CATALOG='IceCreamDB'");
            while (rs.next()) {
                items.add(rs.getString(1));

                ListTable.setItems(items);
            }
        } catch (Exception ex) {
            System.out.println("ERROR: " + ex.getMessage());
        }
    }
}