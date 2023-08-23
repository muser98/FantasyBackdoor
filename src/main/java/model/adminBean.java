package model;

import java.util.Objects;

public class adminBean {
    public String name;
    public int passcode;
    public adminBean(){
        this.name=name;
        this.passcode=passcode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPasscode() {
        return passcode;
    }

    public void setPasscode(int passcode) {
        this.passcode = passcode;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof adminBean)) return false;
        adminBean adminBean = (adminBean) o;
        return getPasscode() == adminBean.getPasscode() && Objects.equals(getName(), adminBean.getName());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getName(), getPasscode());
    }

    @Override
    public String toString() {
        return "adminBean{" +
                "name='" + name + '\'' +
                ", passcode=" + passcode +
                '}';
    }
}
