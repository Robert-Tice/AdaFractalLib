with Computation_Type;
with Image_Types;

generic
   with package CT is new Computation_Type (<>);
   with package IT is new Image_Types (<>);
   Escape_Threshold : CT.Real;
package Julia_Set is
   use CT;

   procedure Calculate_Pixel (Re          : Real;
                              Im          : Real;
                              Z_Escape    : out Real;
                              Iter_Escape : out Natural);

end Julia_Set;
