module libcoupler
    use iso_c_binding

    private
    public :: coupler

    include "coupler_cdef.f90"

    type coupler
       private
       type(c_ptr) :: ptr
    contains
       procedure :: run => run_coupler
       procedure :: init_data => init_data_coupler
       procedure :: allot_add => allot_add_coupler
    end type

    interface coupler
       procedure create_coupler
    end interface

contains

    function create_coupler(in_size)
        implicit none
        type(coupler) :: create_coupler
        integer, intent(in) :: in_size
        create_coupler%ptr = create_coupler_c(in_size)
    end function

    function allot_add_coupler(this,in_pointer,loc)
        implicit none
        type(coupler) :: allot_add_coupler
        class(coupler), intent(in) :: this
        class(coupler), intent(in) :: in_pointer
        integer, intent(in) :: loc 
        allot_add_coupler%ptr = allot_add_coupler_c(in_pointer%ptr,loc)
    end function 
 
    integer function run_coupler(this,snpack_layers_to_save,a1,a2,a3,a4,a5,a6,d1,d2,d3,d4,d5,a7,a8,a9,b1,b2,b3,b4,b5,b6,b7, &
&                             e1,e2,e3,e4,e5,f1,k1,k2,k3,k4,p1, &
&                             n1,n2,n3,n4,n5,m1,m2,n6,n7,n8,n9,n10,n11,n12,n13,n14,arr_1,arr_2,arr_3,arr_4,arr_5,arr_6, &
&                             arr_7,arr_8, &
&                             arr_9,arr_10,arr_11,arr_12,arr_13,arr_14,bs_bool,gg1,wrf_rho,bs_bdg_total,qi_in,qni_in,bs_K,bs_mass_turb, &
&                             bs_number_turb,in_hsalt,psi_s)
        implicit none
        class(coupler), intent(in) :: this
        integer, intent(in) :: snpack_layers_to_save
        double precision, intent(in) :: wrf_rho
        double precision, intent(in) :: a1,a2,a3,a4,a5,a7,a8,a9
        double precision, intent(inout) :: a6
        double precision, intent(inout) :: d1,d2,d3
        double precision, intent(inout) :: d4,d5
        double precision, intent(inout) :: b1,b2,b3,b4,b5,b6,b7
        double precision, intent(inout) :: e1,e2,f1
        double precision, intent(in) :: e3,e4,e5!,f1
        integer, intent(in) :: k1,k2,k3,k4
        double precision, intent(in) :: p1
        double precision, intent(inout) :: m1,m2
        double precision, intent(inout) :: n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14
        double precision, intent(inout), dimension(snpack_layers_to_save) :: arr_1
        double precision, intent(inout), dimension(snpack_layers_to_save) :: arr_2,arr_3,arr_4,arr_5,arr_6,arr_12
        double precision, intent(inout), dimension(snpack_layers_to_save) :: arr_7,arr_8,arr_9,arr_10,arr_11,arr_13,arr_14
        logical,intent(in) :: bs_bool
        integer,intent(inout) :: gg1
        double precision, intent(inout) :: bs_bdg_total,qi_in,qni_in,bs_K,bs_mass_turb,bs_number_turb
        double precision, intent(inout) :: in_hsalt,psi_s
        run_coupler = run_coupler_c(this%ptr,snpack_layers_to_save,a1,a2,a3,a4,a5,a6,d1,d2,d3,d4,d5,a7,a8,a9,b1,b2,b3,b4,b5,b6,b7,&
                            & e1,e2,e3,e4,e5,f1,k1,k2,k3,k4,p1,&
                            & n1,n2,n3,n4,n5,m1,m2,n6,n7,n8,n9,n10,n11,n12,n13,n14,arr_1,&
                            & arr_2,arr_3,arr_4,arr_5,arr_6,arr_7,arr_8,arr_9,arr_10,arr_11,arr_12,arr_13,arr_14,logical(bs_bool,1),&
                            & gg1,wrf_rho,bs_bdg_total,qi_in,qni_in,bs_K,bs_mass_turb,bs_number_turb,in_hsalt,psi_s)
    end function

    integer function init_data_coupler(this,snpack_lay_to_save,a,b,c,d,e,f,g,i,j,yr,month,day,hour,minute,snpack_nlayers, &
&                            arr_T,arr_thick,arr_volI,arr_volW, &
&                            arr_volV,arr_rg,arr_rb,arr_dd,arr_sp,arr_cdot,arr_meta,arr_depd,arr_graintype,arr_mk, &
&                            start_from_file,wrf_rho,snowh,snow,snpack_dt,snpack_write_dt)
        implicit none
        class(coupler), intent(in) :: this
        integer,intent(in) :: snpack_lay_to_save
        double precision, intent(in) :: a,b,c,d,e,wrf_rho
        integer, intent(in) :: f,g,i,j
        integer, intent(in) :: yr,month,day,hour,minute,snpack_nlayers
        double precision, intent(inout), dimension(1:snpack_lay_to_save) :: arr_T,arr_depd
        double precision, intent(inout), dimension(1:snpack_lay_to_save) :: arr_graintype,arr_mk
        double precision, intent(inout), dimension(1:snpack_lay_to_save) :: arr_thick,arr_volI,arr_volW,arr_volV,arr_rg
        double precision, intent(inout), dimension(1:snpack_lay_to_save) :: arr_rb,arr_dd,arr_sp,arr_cdot,arr_meta
        logical,intent(in) :: start_from_file
        double precision, intent(inout) :: snowh,snow
        double precision,intent(inout) :: snpack_dt,snpack_write_dt

        init_data_coupler = init_data_coupler_c(this%ptr,snpack_lay_to_save,a,b,c,d,e,f,g,i,j,yr,month,day,hour,minute,snpack_nlayers,&
                                        & arr_T,arr_thick,arr_volI,arr_volW, &
                                        & arr_volV,arr_rg,arr_rb,arr_dd,arr_sp, &
                                        & arr_cdot,arr_meta,arr_depd,arr_graintype,arr_mk,logical(start_from_file,1), & 
                                        & wrf_rho,snowh,snow,snpack_dt,snpack_write_dt)
    end function 

end module
