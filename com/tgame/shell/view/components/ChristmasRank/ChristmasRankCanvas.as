package com.tgame.shell.view.components.ChristmasRank
{
   import com.fireice.panel.FCanvas;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.text.*;
   
   public class ChristmasRankCanvas extends FCanvas
   {
      
      private var _box:VBox;
      
      private var _infoCanvas:FCanvas;
      
      private var _rankCanvas:RankCanvas;
      
      private var _titleTxt:TextField;
      
      private var _bottomTxt:TextField;
      
      private var _txt1:TextField;
      
      private var _txt2:TextField;
      
      private var _txt3:TextField;
      
      private var _txt4:TextField;
      
      private var tf:TextFormat;
      
      public function ChristmasRankCanvas()
      {
         super();
         this.skin = "box";
         width = 237;
         height = 399 - 18;
         this._box = new VBox(1);
         this.addChild(this._box);
         this._titleTxt = new TextField();
         with(this._titleTxt)
         {
            x = 5;
            y = 2;
            width = this.width;
            height = 23;
            mouseEnabled = false;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            autoSize = TextFieldAutoSize.CENTER;
            text = LanResManager.getLanCommonTextWords("伤害值排行榜");
         }
         this._box.addChild(this._titleTxt);
         this._infoCanvas = new FCanvas();
         with(this._infoCanvas)
         {
            skin = "box";
            x = 2;
            y = 22;
            width = 233;
            height = 74;
         }
         this._box.addChild(this._infoCanvas);
         this._txt1 = this.createTextField();
         this._txt1.x = 2;
         this._txt1.y = 0;
         this._txt2 = this.createTextField();
         this._txt2.x = 2;
         this._txt2.y = 17;
         this._txt3 = this.createTextField();
         this._txt3.x = 2;
         this._txt3.y = 17 * 2;
         this._txt4 = this.createTextField();
         this._txt4.x = 2;
         this._txt4.y = 17 * 3;
         this._infoCanvas.addChild(this._txt1);
         this._infoCanvas.addChild(this._txt2);
         this._infoCanvas.addChild(this._txt3);
         this._infoCanvas.addChild(this._txt4);
         this._txt1.text = LanResManager.getLanCommonTextWords("您的战斗信息：");
         this._txt2.text = LanResManager.getLanCommonTextWords("总量：");
         this._txt3.text = LanResManager.getLanCommonTextWords("百分比：");
         this._txt4.text = LanResManager.getLanCommonTextWords("当前排行：");
         this._rankCanvas = new RankCanvas();
         this._rankCanvas.x = 2;
         this._rankCanvas.y = 112;
         this._box.addChild(this._rankCanvas);
         this._bottomTxt = new TextField();
         with(this._bottomTxt)
         {
            x = 5;
            y = 376;
            width = this.width;
            height = 23;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            mouseEnabled = false;
            autoSize = TextFieldAutoSize.CENTER;
            text = LanResManager.getLanCommonTextWords("只显示前十名玩家的战斗信息");
         }
         this._box.addChild(this._bottomTxt);
      }
      
      public function setData(param1:Array) : void
      {
         this._txt2.text = LanResManager.getLanCommonTextWords("总量：") + param1[0];
         this._txt3.text = LanResManager.getLanCommonTextWords("百分比：") + param1[1];
         this._txt4.text = LanResManager.getLanCommonTextWords("当前排行：") + LanResManager.getLanCommonTextWords("第") + param1[2] + LanResManager.getLanCommonTextWords("位");
         this._rankCanvas.setInitialize(param1[3]);
      }
      
      private function createTextField() : TextField
      {
         var _loc1_:TextField = null;
         _loc1_ = new TextField();
         _loc1_.filters = StaticValue.filter;
         _loc1_.textColor = StaticValue.WHITE;
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.mouseEnabled = false;
         return _loc1_;
      }
   }
}

