package sample;

import com.jfoenix.controls.JFXButton;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;


import java.awt.*;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ResourceBundle;

public class Controller implements Initializable {

    //Login window
    //Username txtfield
    @FXML
    private TextField UsernameBox;
    //Password txtfield
    @FXML
    private TextField PasswordBox;
    //Login Button
    @FXML
    private Button Log;

    ///database info (rough placeholder)
    final String hostname = "";
    final String dbname = "";
    final String port = "";
    final String username = "";
    final String password = "";
    //URL to AWS Database
    final String AWS = "jdbc:mysql://" + hostname + ":" + port + "/" + dbname + "?user=" + username + "&password=" + password;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

        Log.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {

                try
                {
                    Connection conn = DriverManager.getConnection(AWS);
                    Statement stmt = conn.createStatement();
                    System.out.println("CONNECTED");
                }
                catch(Exception ex)
                {
                    System.out.println("ERROR: " + ex.getMessage());
                }

            }
        });

    }
}
