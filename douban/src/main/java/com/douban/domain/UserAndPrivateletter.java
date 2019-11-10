package com.douban.domain;

public class UserAndPrivateletter {

    private User user;

    private Privateletter privateletter;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Privateletter getPrivateletter() {
        return privateletter;
    }

    public void setPrivateletter(Privateletter privateletter) {
        this.privateletter = privateletter;
    }

    public UserAndPrivateletter(User user, Privateletter privateletter) {
        this.user = user;
        this.privateletter = privateletter;
    }

    public UserAndPrivateletter(){}
}
