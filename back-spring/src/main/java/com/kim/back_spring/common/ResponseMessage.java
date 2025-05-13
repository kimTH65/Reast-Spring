package com.kim.back_spring.common;

public class ResponseMessage {
    //200
    String SUCCESS = "Success";

    //400
    String VALIDATION_FAILED = "Validation failed";
    String DUPLICATE_EMAIL = "Duplicate email";
    String DUPLICATE_NICKNAME = "Duplicate nickname";
    String DUPLICATE_TEL_NUMBUR = "Duplicate tel number";
    String NOT_EXISTED_USER = "This user does not exist";
    String NOT_EXISTED_BOARD = "This board does not exist";

    //401
    String SIGN_IN_FAIL = "Login information mismatch";
    String AUTHORIZATION_FAIL = "Authorization faild";

    //403
    String NO_PERMISSION = "Do not have permission";

    //500
    String DATABASE_ERROR = "Database error";

}
