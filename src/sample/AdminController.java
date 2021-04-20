package sample;

import com.sun.scenario.effect.impl.sw.java.JSWBlend_MULTIPLYPeer;
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

public class AdminController implements Initializable {
    public TableView tv1;
    public Button ButtonExit;
    public TextField FirstNameTextField;
    public TextField LastNameTextField;
    public CheckBox IsActiveCheckbox;
    public TextField UserNameTextField;
    public TextField PasswordTextField;
    public ComboBox AdminStatusComboBox;

    private String _employeeid;
    final String AWS = "jdbc:sqlserver://CoT-CIS3365-18:1433;databaseName=IceCreamDB;user=IceCream;password=Vanilla";
    Connection conn;
    public ObservableList<ObservableList> data;

    public void initialize(URL url, ResourceBundle resourceBundle) {
        try {
            conn = DriverManager.getConnection(AWS);
            System.out.println("CONNECTED");

            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM AdminStatus");
            while (rs.next()) {
               AdminStatusComboBox.getItems().addAll(rs.getString("admin_status") +"-"+ rs.getString("adminstatusid"));
            }

        } catch (Exception ex) {
            System.out.println("ERROR: " + ex.getMessage());
        }

    }

    public void Initdata(String employeeid){
        _employeeid = employeeid;
        view();
    }

    public void view() {
        try {
            data = FXCollections.observableArrayList();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT A.adminid, A.first_name, A.last_name, AL.username, AL.password, AST.admin_status FROM Admin A LEFT JOIN AdminLogin AL\n" +
                    "ON A.adminid = AL.adminid\n" +
                    "LEFT JOIN AdminStatus AST\n" +
                    "ON AST.adminstatusid = A.adminstatusid\n" +
                    "WHERE A.employeeid = " + _employeeid);
            //System.out.println(_employeeid);
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

            PreparedStatement pstmt2 = conn.prepareStatement("INSERT INTO Admin (employeeid, first_name, last_name, adminstatusid) Values (?,?,?,?)");
            pstmt2.setInt(1, Integer.parseInt(_employeeid));
            pstmt2.setString(2, FirstNameTextField.getText());
            pstmt2.setString(3, LastNameTextField.getText());
            pstmt2.setInt(4, GetID(AdminStatusComboBox.getValue().toString()));
            pstmt2.executeUpdate();

            ResultSet rs = stmt.executeQuery("SELECT MAX(adminid) ID FROM Admin");
            rs.next();
            int ID = rs.getInt("ID");

            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO AdminLogin (adminid, username, password) Values (?,?,?)");
            pstmt.setInt(1, ID);
            pstmt.setString(2, UserNameTextField.getText());
            pstmt.setString(3, PasswordTextField.getText());
            pstmt.executeUpdate();

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

        PreparedStatement pstmt = conn.prepareStatement("UPDATE Admin SET first_name = ?,last_name = ?, adminstatusid = ? WHERE adminid = " + ID );
        pstmt.setString(1, FirstNameTextField.getText());
        pstmt.setString(2, LastNameTextField.getText());
        pstmt.setInt(3, GetID(AdminStatusComboBox.getValue().toString()));
        pstmt.executeUpdate();

        PreparedStatement pstmt2 = conn.prepareStatement("UPDATE AdminLogin SET username = ?,password = ? WHERE adminid = " + ID );
        pstmt2.setString(1, UserNameTextField.getText());
        pstmt2.setString(2, PasswordTextField.getText());
        pstmt2.executeUpdate();
        view();
    }

    public void Exit(ActionEvent actionEvent) throws Exception{
        Parent root = FXMLLoader.load(getClass().getResource("Employee.fxml"));
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
