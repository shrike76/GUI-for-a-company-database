package sample;

//import com.jfoenix.controls.JFXButton;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;


import java.io.IOException;
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
    final String AWS = "jdbc:sqlserver://CoT-CIS3365-18:1433;databaseName=IceCreamDB;user=IceCream;password=Vanilla";

    private Stage window;
    private Parent root;

    //handles fxml scene switches. code borrowed from https://www.reddit.com/r/javahelp/comments/46v78j/javafx_changing_between_fxml_scenes_on_press_of/
    @FXML
    private void sceneHandler() throws IOException {
        System.out.println("Scene changing...");
        root = FXMLLoader.load(getClass().getResource("mainmenu.fxml"));
        window.setScene(new Scene(root));
        window.show();
    }

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
                    //Parent root = FXMLLoader.load(getClass().getResource("MainmenuController.fxml"));
                    //window.setScene(new Scene(root));
                    //window.show();
                    sceneHandler();

                }
                catch(Exception ex)
                {
                    System.out.println("ERROR: " + ex.getMessage());
                }

            }
        });
    }
}
