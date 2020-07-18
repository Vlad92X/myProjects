package com.example.listusers.api.model;

import com.example.listusers.model.User;

import java.util.List;



public class RandomUserResponse {

    private List<User> results;
    private Info info;

    public RandomUserResponse() {
    }

    public List<User> getResults() {
        return results;
    }

    public void setResults(List<User> results) {
        this.results = results;
    }

    public Info getInfo() {
        return info;
    }

    public void setInfo(Info info) {
        this.info = info;
    }
}
