CLASS zul_cl_app_buffer DEFINITION
  PUBLIC
  CREATE PRIVATE.

  PUBLIC SECTION.
    INTERFACES: zul_if_app_buffer.
    ALIASES: add_message FOR zul_if_app_buffer~add_message,
             get_buffer FOR zul_if_app_buffer~get_buffer.
    METHODS: constructor.
    CLASS-METHODS get_instance
      RETURNING
        VALUE(ro_instance) TYPE REF TO zul_if_app_buffer.
  PROTECTED SECTION.

  PRIVATE SECTION.
    CLASS-DATA mo_instance TYPE REF TO zul_cl_app_buffer.
    "some other logic
    DATA: mt_buffer TYPE zul_singleton_string_table.
ENDCLASS.



CLASS zul_cl_app_buffer IMPLEMENTATION.
  METHOD constructor.
    "if some complicated logic is needed
  ENDMETHOD.

  METHOD get_instance.
    mo_instance = COND #( WHEN mo_instance IS BOUND
                          THEN mo_instance
                          ELSE NEW #( ) ).

    RETURN mo_instance.
  ENDMETHOD.

  METHOD add_message.
    mt_buffer = VALUE #( BASE mt_buffer ( iv_message ) ).
  ENDMETHOD.

  METHOD get_buffer.
    RETURN mt_buffer.
  ENDMETHOD.
ENDCLASS.
