package com.zcp.common.cache
{
   import com.zcp.common.linkedlist.LNode;
   import com.zcp.common.utils.Fun;
   import flash.display.*;
   
   public class CacheUnit extends LNode
   {
      
      public function CacheUnit(param1:Object, param2:String)
      {
         super(param1,param2);
      }
      
      public function dispose() : void
      {
         if(data is BitmapData)
         {
            (data as BitmapData).dispose();
         }
         else if(data is DisplayObject)
         {
            if(Boolean(data.parent) && !(data.parent is Loader))
            {
               data.parent.removeChild(data);
            }
            Fun.clearChildren(data as DisplayObject,true);
         }
         data = null;
         pre = null;
         next = null;
      }
   }
}

