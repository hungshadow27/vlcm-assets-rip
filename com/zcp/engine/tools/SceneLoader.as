package com.zcp.engine.tools
{
   import br.com.stimuli.loading.BulkLoader;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.LoaderManager;
   import flash.events.Event;
   
   public class SceneLoader
   {
      
      public static var smallMapImgLoader:BulkLoader = LoaderManager.creatNewLoader("smallMapImgLoader",function allLoadComplete(param1:Event):void
      {
         Fun.doGC();
      });
      
      public static var mapImgLoader:BulkLoader = LoaderManager.creatNewLoader("mapImgLoader",function allLoadComplete(param1:Event):void
      {
         Fun.doGC();
      });
      
      public static var avatarXmlLoader:BulkLoader = LoaderManager.creatNewLoader("avatarXmlLoader",function allLoadComplete(param1:Event):void
      {
         Fun.doGC();
      });
      
      public function SceneLoader()
      {
         super();
      }
   }
}

