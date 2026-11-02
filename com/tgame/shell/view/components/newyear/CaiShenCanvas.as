package com.tgame.shell.view.components.newyear
{
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class CaiShenCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var ft:FTextArea;
      
      public function CaiShenCanvas()
      {
         super();
         var _loc1_:DisplayObject = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/newyear/bg3.png",532,560);
         _loc1_.x = 10;
         _loc1_.y = 2;
         addChild(_loc1_);
         this.ft = new FTextArea();
         this.ft.x = 32;
         this.ft.y = 420;
         this.ft.wordWrap = true;
         this.ft.width = 500;
         this.ft.textColor = StaticValue.YELLOW;
         this.ft.htmlText = "<textformat leading=\'8\'>" + LanResManager.getLanCommonTextWords("2014年1月30日-2014年2月7日每天的10:00-22:00可以参与【财神送瑞兽】活动；") + "<br>" + LanResManager.getLanCommonTextWords("财神宫的瑞兽趁财神收拾行装之际提前变幻成财神的模样私下凡间，想一睹世间之繁荣；") + "<br>" + LanResManager.getLanCommonTextWords("瑞兽幻化的财神会在任何一条线的其中一张野外地图内刷出，等待有缘人的到来；") + "<br>" + LanResManager.getLanCommonTextWords("击败【幻化的财神】将其驯服，就有可以获得该瑞兽，瑞兽在凡间可以停留30天，") + "<br>" + LanResManager.getLanCommonTextWords("和你一同驰骋疆场") + "</textformat>";
         this.ft.setTextFormat(new TextFormat(null,12));
         addChild(this.ft);
      }
   }
}

