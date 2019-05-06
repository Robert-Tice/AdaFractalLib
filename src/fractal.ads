with Ada.Synchronous_Barriers; use Ada.Synchronous_Barriers;

with System;

with Computation_Type;
with Image_Types;

generic
   with package CT is new Computation_Type (<>);
   with package IT is new Image_Types (<>);
   with procedure Calculate_Pixel (Re          : CT.Real;
                                   Im          : CT.Real;
                                   Z_Escape    : out CT.Real;
                                   Iter_Escape : out Natural);
   Task_Pool_Size : Natural;
package Fractal is
   use CT;
   use IT;

   procedure Init (Viewport : Viewport_Info);

   procedure Set_Size (Viewport : Viewport_Info);

   procedure Calculate_Image (Buffer : not null Buffer_Access);

--   procedure Increment_Frame;

   function Get_Buffer_Size return Buffer_Offset;

   procedure Calculate_Row (Y      : ImgHeight;
                            Idx    : Buffer_Offset;
                            Buffer : not null Buffer_Access);

private

   Real_Distance_Unzoomed : constant Real := To_Real (4);

   type Complex_Coordinate is record
      Re : Real;
      Im : Real;
   end record;

   S_Width        : ImgWidth;
   S_Height       : ImgHeight;
   S_Zoom         : ImgZoom;
   S_Center       : Complex_Coordinate;

   S_Step         : Complex_Coordinate;
   S_Max          : Complex_Coordinate;
   S_Min          : Complex_Coordinate;

--   S_Frame_Counter : Color := Color'First;
   S_Cnt_Up        : Boolean := True;

   procedure Calculate_Bounds;

   procedure Calculate_Step;

--     procedure Calculate_Pixel_Color (Z_Escape     : Real;
--                                      Iter_Escape  : Natural;
--                                      Px           : out Pixel);

   function Get_Coordinate (X : ImgWidth;
                            Y : ImgHeight)
                            return Complex_Coordinate;

   function Get_Coordinate (Coord : Coordinate) return Complex_Coordinate is
     (Get_Coordinate (X => Coord.X,
                      Y => Coord.Y));

   function Get_Width return ImgWidth is
     (S_Width);

   function Get_Height return ImgHeight is
     (S_Height);

   function Get_Buffer_Size return Buffer_Offset is
     (Buffer_Offset (S_Width * S_Height * (Pixel'Size / 8)));

end Fractal;
