INTERFACE zul_if_app_processor1
  PUBLIC .
  METHODS: process1 IMPORTING io_buffer        TYPE REF TO zul_if_app_buffer
                    RETURNING VALUE(ro_result) TYPE i.
ENDINTERFACE.
