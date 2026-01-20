*"* use this source file for your ABAP unit test classes
CLASS ltcl_app_buffer DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      setup,
      teardown,
      first_test FOR TESTING RAISING cx_static_check.

    DATA mt_expected TYPE zul_singleton_string_table.
ENDCLASS.

CLASS ltcl_app_buffer IMPLEMENTATION.
  METHOD setup.
    mt_expected = VALUE #( ( CONV #( 'Test message for buffer 1' ) )
                         ( CONV #( 'Test message for buffer 2' ) ) ).
  ENDMETHOD.

  METHOD teardown.
    FREE mt_expected.
  ENDMETHOD.

  METHOD first_test.
    DATA(lo_cut1) = zul_cl_app_buffer=>get_instance( ).
    lo_cut1->add_message( 'Test message for buffer 1' ).
    DATA(lo_cut2) = zul_cl_app_buffer=>get_instance( ).
    lo_cut2->add_message( 'Test message for buffer 2' ).
    DATA(lo_result) = zul_cl_app_buffer=>get_instance( ).
    DATA(lt_result) = lo_result->get_buffer( ).

    cl_abap_unit_assert=>assert_equals( act = lt_result exp = mt_expected msg = 'Messages are not gathered in one buffer' ).
  ENDMETHOD.
ENDCLASS.
