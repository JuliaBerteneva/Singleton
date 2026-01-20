*"* use this source file for your ABAP unit test classes
CLASS ltcl_application1 DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_buffer_double TYPE REF TO zul_if_app_buffer.
    DATA mo_cut TYPE REF TO zul_if_app_processor1.
    DATA mt_expected_buffer_data TYPE zul_singleton_string_table.
    DATA mt_empty_buffer_data TYPE zul_singleton_string_table.
    DATA mt_actual_buffer_data TYPE zul_singleton_string_table.
    METHODS:
      setup,
      teardown,
      first_test FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_application1 IMPLEMENTATION.

  METHOD setup.
    mt_expected_buffer_data = VALUE #( ( CONV #( 'Test message for buffer 1' ) )
                         ( CONV #( 'Test message for buffer 2' ) ) ).
  ENDMETHOD.
  METHOD teardown.
    FREE: mo_cut, mo_buffer_double, mt_expected_buffer_data, mt_actual_buffer_data.
  ENDMETHOD.
  METHOD first_test.
    mo_cut = NEW zul_cl_application1(  ).
    mo_buffer_double ?= cl_abap_testdouble=>create( 'zul_if_app_buffer' ).

    cl_abap_testdouble=>configure_call( mo_buffer_double )->returning( mt_expected_buffer_data ).
    mo_buffer_double->get_buffer( ).

    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->process1( CAST #( mo_buffer_double ) )
      exp = 4
      msg = 'Class did not gathered errors as expected' ).

    cl_abap_testdouble=>configure_call( mo_buffer_double )->returning( mt_empty_buffer_data ).
    mo_buffer_double->get_buffer( ).

    cl_abap_unit_assert=>assert_equals(
      act = mo_cut->process1( CAST #( mo_buffer_double ) )
      exp = 0
      msg = 'Class did not gathered errors as expected' ).

  ENDMETHOD.

ENDCLASS.
