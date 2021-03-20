module funcs
     use libcoupler
     implicit none

     type all_f
       type(coupler),dimension(:),allocatable :: f
     end type all_f
     
     type dataPointer
      type(all_f), pointer :: p
     end type dataPointer
 
     type(dataPointer),dimension(:),allocatable :: global_f
     contains

subroutine initialize_global_f(max_dom,grid_id)

implicit none
integer, intent(in) :: max_dom
integer, intent(in) :: grid_id
integer :: i

if( .not. allocated(global_f)) then
  write(*,*) 'GOD HELP ME'
  allocate(global_f(max_dom))
  do i = 1,max_dom
    allocate(global_f(i)%p)
  enddo
endif
!if(associated(global_f(grid_id)%p)) then
!        write(*,*) 'HOLY JESUS'
!allocate(global_f(grid_id)%p)
!endif
  write(*,*) 'size of global array: ',size(global_f),sizeof(global_f(1)),sizeof(global_f(2))
end subroutine

subroutine initialize_f(grid_id,f_size,new_alloc)

implicit none
integer, intent(in) :: f_size
integer, intent(in) :: grid_id
type(coupler) :: loc_f,tmp_f 
integer :: tmp_loc,i,tmp
logical,intent(inout) :: new_alloc

write(*,*) ' HEART OF THE MADNESS' , grid_id , f_size, size(global_f(grid_id)%p%f)

new_alloc = .false.
if( f_size .ne. size(global_f(grid_id)%p%f) .or. (f_size .eq. 1)) then

   allocate(global_f(grid_id)%p%f(f_size))
   loc_f = coupler(f_size)
   do i=1,f_size
      tmp_loc = i-1
      tmp_f = global_f(grid_id)%p%f(i)%allot_add(loc_f,tmp_loc)
      global_f(grid_id)%p%f(i) = tmp_f
   enddo 
   new_alloc = .true.

   write(*,*) 'size of snowpack vectors: ',grid_id,size(global_f(grid_id)%p%f), &
&              sizeof(global_f(grid_id)%p),sizeof(global_f(grid_id)%p%f)


endif 


end subroutine initialize_f

subroutine init_snowpack(grid_id,f_counter,snpack_layers_to_save,Lat,Lon,Altitude,sn_tsk,in_calc_step_length, &
&                        loc_I,loc_J,yr,month,day,hour,minute,&
&                        snpack_nlayers, arr_1,arr_2,arr_3,arr_4,arr_5,arr_6,arr_7,arr_8,arr_9,arr_10,&
&                        arr_11,arr_12,arr_13,arr_14,start_from_file,wrf_rho,snowh,snow,snpack_dt,snpack_write_dt )

implicit none
integer, intent(in) :: f_counter,grid_id,loc_I,loc_J
integer, intent(in) :: yr,month,day,hour,minute,snpack_nlayers
double precision,intent(in) :: wrf_rho
double precision,intent(in) :: Lat,Lon,Altitude,sn_tsk,in_calc_step_length
integer, intent(in) :: snpack_layers_to_save
double precision, intent(inout), dimension(snpack_layers_to_save) :: arr_1,arr_2,arr_3,arr_4,arr_5,arr_6
double precision, intent(inout), dimension(snpack_layers_to_save) :: arr_7,arr_8,arr_9,arr_10,arr_11,arr_12
double precision, intent(inout), dimension(snpack_layers_to_save) :: arr_13,arr_14

logical,intent(in) :: start_from_file
double precision, intent(inout) :: snowh,snow
double precision, intent(inout) :: snpack_dt,snpack_write_dt
integer :: tmp

       tmp=global_f(grid_id)%p%f(f_counter)%init_data(snpack_layers_to_save,Lat,Lon,Altitude, &
&                                sn_tsk,in_calc_step_length,f_counter,grid_id, &
&                                loc_I,loc_J,yr,month,day,hour,minute,snpack_nlayers,arr_1,arr_2,arr_3,arr_4,arr_5, &
&                                arr_6,arr_7,arr_8,arr_9,arr_10,arr_11,arr_12,arr_13,arr_14,start_from_file,wrf_rho, &
&                                snowh,snow, snpack_dt,snpack_write_dt)

       write(*,*) 'ALLOCATED snowpack at ID,GRID:',grid_id,f_counter

end subroutine init_snowpack

subroutine run_code(grid_id,f_counter,snpack_layers_to_save,a1,a2,a3,a4,a5,a6,d1,d2,d3,d4,d5,a7,a8, &
&                     a9,b1,b2,b3,b4,b5,b6,b7,e1,e2,e3,e4,e5,f1,k1,k2,p1,&
&                     n1,n2,n3,n4,n5,m1,m2,n6,n7,n8,n9,n10,n11,n12,n13,n14,arr_1,arr_2,arr_3,arr_4,arr_5,&
&                     arr_6,arr_7,arr_8,arr_9,arr_10,&
&                     arr_11,arr_12,arr_13,arr_14,bs_bool,gg1,wrf_rho,bs_bdg_total,qi_in,qni_in,bs_K,bs_mass_turb, &
&                     bs_number_turb,in_hsalt,psi_s)

implicit none
integer, intent(in) :: f_counter,grid_id
integer, intent(in) :: snpack_layers_to_save
double precision, intent(in) :: wrf_rho
double precision, intent(in) :: a1,a2,a3,a4,a5,a7,a8,a9
double precision, intent(inout) :: a6
double precision, intent(inout) :: d1,d2,d3,d4,d5
double precision, intent(inout) :: b1,b2,b3,b4,b5,b6,b7
double precision, intent(inout) :: e1,e2,f1
double precision, intent(in) :: e3,e4,e5 !,f1
double precision, intent(in) :: p1
double precision, intent(inout) :: m1,m2
double precision, intent(inout) :: n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14
double precision, intent(inout), dimension(snpack_layers_to_save) :: arr_1,arr_2,arr_3,arr_4,arr_5,arr_6
double precision, intent(inout), dimension(snpack_layers_to_save) :: arr_7,arr_8,arr_9,arr_10,arr_11,arr_12
double precision, intent(inout), dimension(snpack_layers_to_save) :: arr_13,arr_14
logical, intent(in) :: bs_bool
integer, intent(in) :: k1,k2
integer, intent(inout) :: gg1
integer :: tmp
double precision, intent(inout) :: bs_bdg_total,qi_in,qni_in,bs_K,bs_mass_turb,bs_number_turb
double precision, intent(inout) :: in_hsalt,psi_s

!       write(*,*) 'INSIDE FUNCS: ',a1,a2,a3,a4,a5,a6,a7,a8,a9
       tmp=global_f(grid_id)%p%f(f_counter)%run(snpack_layers_to_save,a1,a2,a3,a4,a5,a6, &
&                    d1,d2,d3,d4,d5,a7,a8,a9,b1,b2,b3,b4,b5,b6,b7, &
&                    e1,e2,e3,e4,e5,f1,f_counter,grid_id,k1,k2,p1, &
&                    n1,n2,n3,n4,n5,m1,m2,n6,n7,n8,n9,n10,n11,n12,n13, &
&                    n14,arr_1,arr_2,arr_3,arr_4,arr_5,arr_6, &
&                    arr_7,arr_8,arr_9,arr_10,arr_11,arr_12,arr_13,arr_14,bs_bool,gg1,&
&                    wrf_rho,bs_bdg_total,qi_in,qni_in,bs_K,bs_mass_turb, &
&                    bs_number_turb,in_hsalt,psi_s)

end subroutine

subroutine dealloc_all(grid_id)

implicit none
integer, intent(in) :: grid_id

deallocate(global_f(grid_id)%p%f)
deallocate(global_f(grid_id)%p)

end subroutine

subroutine dealloc_global

deallocate(global_f)

end subroutine 

end module funcs
