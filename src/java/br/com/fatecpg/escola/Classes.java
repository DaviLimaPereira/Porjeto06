/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.escola;

/**
 *
 * @author davil
 */
public class Classes {
    private long id;
    private String class_name;
    private String period_class;
    private long id_teacher;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public String getPeriod_class() {
        return period_class;
    }

    public void setPeriod_class(String period_class) {
        this.period_class = period_class;
    }

    public long getId_teacher() {
        return id_teacher;
    }

    public void setId_teacher(long id_teacher) {
        this.id_teacher = id_teacher;
    }

    public Classes(long id, String class_name, String period_class) {
        this.id = id;
        this.class_name = class_name;
        this.period_class = period_class;
    }

    public Classes(long id, String class_name, String period_class, long id_teacher) {
        this.id = id;
        this.class_name = class_name;
        this.period_class = period_class;
        this.id_teacher = id_teacher;
    }
    
    public static void addClass(String class_name, String period_class) throws Exception{
        String SQL = "INSERT INTO classes VALUES(default,?,?)";
        Object parameters[] = {class_name, period_class};
        DbConnector.execute(SQL, parameters);
    }
    
    public static void addClassTeacher(long id_teacher, long id) throws Exception{
        String SQL = "UPDATE classes SET id_teacher = ? WHERE id = ?;";
        Object parameters[] = {id_teacher, id};
        DbConnector.execute(SQL, parameters);
    }
    
    public static void removeClass(long id) throws Exception{
        String SQL = "DELETE FROM classes WHERE ID = ?";
        Object parameters[] = {id};
        DbConnector.execute(SQL, parameters);
    }
}
