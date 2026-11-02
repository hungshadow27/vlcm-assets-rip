package com.fireice.init
{
   import com.fireice.util.LayoutManager;
   import flash.display.Stage;
   
   public class SkinInit
   {
      
      private static var config:Config;
      
      public function SkinInit()
      {
         super();
         throw new Error("非法实例化Init类!");
      }
      
      public static function initConfig(param1:Stage, param2:XML) : void
      {
         config = new Config(param1,param2);
         LayoutManager.getInstance().setStage(param1);
      }
      
      public static function getSkinConfigByName(param1:String) : XML
      {
         if(config == null)
         {
            throw new Error("没有初化UI组件!");
         }
         return config.getSkinConfigByName(param1);
      }
   }
}

import com.fireice.util.Tools;
import flash.display.Stage;

class Config
{
   
   private var xml:XML;
   
   public function Config(param1:Stage, param2:XML)
   {
      super();
      if(param1 == null)
      {
         throw new Error("初始化失败(stage为空)!");
      }
      if(param2 == null)
      {
         throw new Error("初始化失败(皮肤配置文件为空)!");
      }
      Tools.currentStage = param1;
      this.xml = param2;
   }
   
   public function getSkinConfigByName(param1:String) : XML
   {
      return this.xml[param1][0];
   }
}
