CLASS zul_cl_application1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zul_if_app_processor1.
    ALIASES process1 FOR zul_if_app_processor1~process1.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS: step1.
ENDCLASS.

CLASS zul_cl_application1 IMPLEMENTATION.
  METHOD process1.

    "some logic...

    IF io_buffer IS NOT BOUND.
      DATA(lo_buffer) = zul_cl_app_buffer=>get_instance( ).
    ELSE.
      lo_buffer = io_buffer.
    ENDIF.

    lo_buffer->add_message( 'First message' ).
    me->step1( ).

    "check result of buffer
    DATA(lt_messages) = lo_buffer->get_buffer( ).

    IF lt_messages IS NOT INITIAL.
      RETURN 4.
    ENDIF.
  ENDMETHOD.

  METHOD step1.

    "some logic...

    zul_cl_app_buffer=>get_instance( )->add_message( 'Second message' ).
  ENDMETHOD.
ENDCLASS.
