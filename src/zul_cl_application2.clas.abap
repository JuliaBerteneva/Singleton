CLASS zul_cl_application2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES: zul_if_app_processor2.
    ALIASES process1 FOR zul_if_app_processor2~process1.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS: step1.
  DATA: mo_buffer TYPE REF TO zul_if_app_buffer.
ENDCLASS.

CLASS zul_cl_application2 IMPLEMENTATION.
  METHOD process1.

    "some logic...
    IF mo_buffer IS NOT BOUND.
      mo_buffer = zul_cl_app_buffer=>get_instance( ).
    ENDIF.

    mo_buffer->add_message( 'First message' ).
    me->step1( ).

    "check result of buffer
    DATA(lt_messages) = mo_buffer->get_buffer( ).

    IF lt_messages IS NOT INITIAL.
      RETURN 4.
    ENDIF.
  ENDMETHOD.

  METHOD step1.

    "some logic...

    zul_cl_app_buffer=>get_instance( )->add_message( 'Second message' ).
  ENDMETHOD.
ENDCLASS.
