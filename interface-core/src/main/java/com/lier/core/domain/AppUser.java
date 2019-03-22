package com.lier.core.domain;

import javax.persistence.Table;
import java.io.Serializable;

@Table(name = "dgg_user_app")
public class AppUser implements Serializable {
    private Long id;

    private String username;

    private String password;


}
