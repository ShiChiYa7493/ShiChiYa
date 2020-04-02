package com.example.shichiya.result;

public enum ResultCode {
    SUCCESS(200),
    FAIL(400);

    public int code;

    ResultCode(int code) {
        this.code = code;
    }
}
