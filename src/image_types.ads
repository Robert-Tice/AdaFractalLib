generic
   type Pixel is private;
   with procedure Color_Pixel (Z_Escape    : Boolean;
                               Iter_Escape : Natural;
                               Px          : out Pixel);
   Max_Iterations : Natural;
package Image_Types is

   subtype ImgWidth is Positive range 1 .. 1920;
   subtype ImgHeight is Positive range 1 .. 1080;
   subtype ImgZoom is Positive range 1 .. 1000;

   type Coordinate is record
      X : ImgWidth := ImgWidth'First;
      Y : ImgHeight := ImgHeight'First;
   end record;

   type Viewport_Info is record
      Width  : ImgWidth := ImgWidth'Last;
      Height : ImgHeight := ImgHeight'Last;
      Zoom   : ImgZoom := 10;
      Center : Coordinate;
   end record;

   type Pixel_Array is array
     (Natural range <>) of Pixel
     with Pack;

   type Pixel_Array_Ptr is access all Pixel_Array;

   type Buffer_Element is mod 2 ** Standard'Storage_Unit;
   type Buffer_Offset is new Long_Long_Integer;
   type Buffer_Array is array (Buffer_Offset range <>) of Buffer_Element
     with Alignment => 4;
   type Buffer_Access is access all Buffer_Array;


end Image_Types;
