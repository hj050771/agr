package com.cesgroup.agr.vo;

import java.util.List;

public class Nodes {
    private String id;
    private String name;
    private boolean spread;
    private List<Nodes> children;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean getSpread() {
        return spread;
    }

    public void setSpread(boolean spread) {
        this.spread = spread;
    }

    public List<Nodes> getChildren() {
        return children;
    }

    public void setChildren(List<Nodes> children) {
        this.children = children;
    }
}
