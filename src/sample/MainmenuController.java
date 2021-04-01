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

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MainmenuController {

    @FXML
    ListView<String> ListTable;

    ObservableList<String> items = FXCollections.observableArrayList();

    //displays all table names of database on initialize
    public void initialize() {
        ResultSet rs = null;
        Statement stmt = null;
        try{
            //PreparedStatement stmt = conn.prepareStatement("SELECT DBIceCream FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_CATALOG='DBIceCream'");
            rs = stmt.executeQuery("SELECT DBIceCream FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_CATALOG='DBIceCream'");
            while (rs.next()) {
                items.add(rs.getString(1));
                System.out.println(rs.getString(1));
            }
        }

        catch (SQLException e){
            System.out.println("print error");
        }
    }
}
