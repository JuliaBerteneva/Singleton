INTERFACE zul_if_app_buffer
  PUBLIC .
  METHODS: add_message IMPORTING iv_message TYPE string,
    get_buffer RETURNING VALUE(rt_buffer) TYPE zul_singleton_string_table.
ENDINTERFACE.
