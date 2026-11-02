package game.manager
{
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import game.display.ScaleBitmapData;
   import game.vo.imgVO;
   
   public class ImageCacheManager
   {
      
      private static var bitmapDatas:Dictionary = new Dictionary();
      
      private static var _resRootURL:String = "/";
      
      public function ImageCacheManager()
      {
         super();
         throw new Error("本类不能实例化");
      }
      
      public static function getBitmapData(param1:String, param2:int, param3:int, param4:Boolean = true, param5:Function = null) : BitmapData
      {
         if(param4)
         {
            if(bitmapDatas[param1])
            {
               return (bitmapDatas[param1] as imgVO).getBitmapdata(param5);
            }
            bitmapDatas[param1] = new imgVO(param1,param2,param3);
            return (bitmapDatas[param1] as imgVO).getBitmapdata(param5);
         }
         return new imgVO(param1,param2,param3).getBitmapdata(param5);
      }
      
      public static function getScaleBitmapdata(param1:String, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:Boolean = true, param9:Function = null) : ScaleBitmapData
      {
         if(param8)
         {
            if(bitmapDatas[param1])
            {
               return (bitmapDatas[param1] as imgVO).getScaleBitmapdata(new Rectangle(param7,param4,param2 - param5 - param7,param3 - param4 - param6),param9);
            }
            bitmapDatas[param1] = new imgVO(param1,param2,param3);
            return (bitmapDatas[param1] as imgVO).getScaleBitmapdata(new Rectangle(param7,param4,param2 - param5 - param7,param3 - param4 - param6),param9);
         }
         return new imgVO(param1,param2,param3).getScaleBitmapdata(new Rectangle(param7,param4,param2 - param5 - param7,param3 - param4 - param6),param9);
      }
      
      public static function mergeBitmapDataMap(param1:Dictionary) : void
      {
         var _loc2_:imgVO = null;
         var _loc3_:BitmapData = null;
         var _loc4_:String = null;
         for(_loc4_ in param1)
         {
            _loc3_ = param1[_loc4_] as BitmapData;
            _loc2_ = new imgVO(_loc4_,_loc3_.width,_loc3_.height);
            _loc2_.bitmapdata = _loc3_;
            bitmapDatas[_loc4_] = _loc2_;
         }
      }
   }
}

