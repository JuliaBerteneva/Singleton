*&---------------------------------------------------------------------*
*& Report zul_r_singleton
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zul_r_singleton.
PARAMETER p_test TYPE char10.

CLASS lcl_application DEFINITION CREATE PRIVATE.
  PUBLIC SECTION.
    CLASS-METHODS: get_instance RETURNING VALUE(ro_app) TYPE REF TO lcl_application,
      start.
    METHODS: add_message IMPORTING iv_message TYPE string,
      get_messages RETURNING VALUE(rt_messages) TYPE zul_singleton_string_table.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA: mo_app TYPE REF TO lcl_application.
    DATA: mt_buffer TYPE zul_singleton_string_table.
ENDCLASS.

CLASS lcl_application IMPLEMENTATION.
  METHOD get_instance.
    IF mo_app IS NOT BOUND.
      mo_app = NEW #( ).
    ENDIF.
    RETURN mo_app.
  ENDMETHOD.

  METHOD add_message.
    mt_buffer = VALUE #( BASE mt_buffer ( iv_message ) ).
  ENDMETHOD.

  METHOD get_messages.
    RETURN mt_buffer.
  ENDMETHOD.

  METHOD start.
    "do some logic
    DATA(lo_app) = get_instance(  ).

    lo_app->add_message( 'First message of the run' ).
    lo_app->add_message( |Current SS field is { p_test }| ).

    DATA(lt_messages) = lo_app->get_messages(  ).
    LOOP AT lt_messages ASSIGNING FIELD-SYMBOL(<ls_message>).
      WRITE / <ls_message>.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  lcl_application=>start( ).
