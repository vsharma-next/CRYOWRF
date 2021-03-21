interface
    function create_coupler_c(in_size) bind(C, name="create_coupler")
        use iso_c_binding
        implicit none
        type(c_ptr) :: create_coupler_c
        integer(c_int), value :: in_size
    end function

    function allot_add_coupler_c(in_pointer,loc) bind(C, name="allot_add_coupler")
        use iso_c_binding
        implicit none
        type(c_ptr)           :: allot_add_coupler_c
        type(c_ptr),value     :: in_pointer
        integer(c_int), value :: loc
    end function
 
    function init_data_coupler_c(coupler,snpack_layers_to_save,a,b,c,d,e,f,g,i,j,yr,month,day,hour,minute,snpack_nlayers, &
&                            arr_T,arr_thick,arr_volI,arr_volW, &
&                            arr_volV,arr_rg,arr_rb,arr_dd,arr_sp,arr_cdot,arr_meta,&
&                            arr_depd,arr_graintype,arr_mk,start_from_file,wrf_rho,snowh,snow,snpack_dt,snpack_write_dt ) bind(C, name="init_data_coupler")
        use iso_c_binding
        implicit none
        real(c_double) :: init_data_coupler_c
        real(c_double) :: snpack_dt,snpack_write_dt
        type(c_ptr), value :: coupler
        real(c_double), value :: wrf_rho
        real(c_double), value :: a
        real(c_double), value :: b
        real(c_double), value :: c
        real(c_double), value :: d
        real(c_double), value :: e
        integer(c_int), value :: f
        integer(c_int), value :: g
        integer(c_int), value :: i
        integer(c_int), value :: j
        integer(c_int), value :: yr,month,day,hour,minute
        integer(c_int), value :: snpack_nlayers
        integer(c_int), value :: snpack_layers_to_save
        real(c_double),dimension(snpack_layers_to_save) :: arr_T,arr_thick,arr_volI,arr_volW
        real(c_double),dimension(snpack_layers_to_save) :: arr_volV,arr_rg,arr_rb,arr_dd,arr_sp,arr_cdot,arr_meta
        real(c_double),dimension(snpack_layers_to_save) :: arr_depd,arr_graintype,arr_mk
        logical(c_bool),value :: start_from_file
        real(c_double) :: snowh,snow        
    end function

    function run_coupler_c(coupler,snpack_layers_to_save,a1,a2,a3,a4,a5,a6,d1,d2,d3,d4, &
&                       d5,a7,a8,a9,b1,b2,b3,b4,b5,b6,b7,e1, &
&                       e2,e3,e4,e5,f1,k1,k2,k3,k4,p1,n1,n2,n3,n4,n5,m1,m2,n6,n7,n8,n9,n10, &
&                       n11,n12,n13,n14,arr_T,arr_thick,arr_volI,arr_volW, &
&                       arr_volV,arr_rg,arr_rb,arr_dd,arr_sp,arr_cdot,arr_meta,arr_depd,arr_graintype,arr_mk,bs_bool,gg1, & 
&                       wrf_rho,bs_bdg_total,qi_in,qni_in,bs_K,bs_mass_turb,bs_number_turb,in_hsalt,psi_s, &
&                       loc_sza,tau_qc,tau_qi,tau_qc_tot,tau_qi_tot    ) bind(C, name="run_coupler")
        use iso_c_binding
        implicit none
        integer(c_int),value :: snpack_layers_to_save
        real(c_double) :: bs_bdg_total,qi_in,qni_in,bs_K,bs_mass_turb,bs_number_turb
        real(c_double) :: in_hsalt
        real(c_double), value :: wrf_rho
        integer(c_int) :: run_coupler_c
        type(c_ptr), value :: coupler
        real(c_double), value :: a1
        real(c_double), value :: a2
        real(c_double), value :: a3
        real(c_double), value :: a4
        real(c_double), value :: a5
        real(c_double) :: a6
        real(c_double) :: d1
        real(c_double) :: d2
        real(c_double) :: d3
        real(c_double) :: d4
        real(c_double) :: d5
        real(c_double) :: e1,e2
        real(c_double), value :: e3,e4,e5
        real(c_double), value :: a7
        real(c_double), value :: a8
        real(c_double), value :: a9
        real(c_double) :: f1
        real(c_double) :: b1
        real(c_double) :: b2
        real(c_double) :: b3
        real(c_double) :: b4
        real(c_double) :: b5
        real(c_double) :: b6
        real(c_double) :: b7
        integer(c_int), value :: k1,k2,k3,k4
        integer(c_int) :: gg1
        real(c_double), value :: p1
        real(c_double) :: m1,m2
        real(c_double) :: n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14
        real(c_double),dimension(snpack_layers_to_save) :: arr_T,arr_thick,arr_volI,arr_volW,arr_depd
        real(c_double),dimension(snpack_layers_to_save) :: arr_graintype,arr_mk
        real(c_double),dimension(snpack_layers_to_save) :: arr_volV,arr_rg,arr_rb,arr_dd,arr_sp,arr_cdot,arr_meta
        logical(c_bool),value :: bs_bool
        real(c_double) :: psi_s
        real(c_double),value :: loc_sza,tau_qc,tau_qi,tau_qc_tot,tau_qi_tot
    end function
end interface
