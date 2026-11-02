package com.tgame.shell.view.components.mainui
{
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class MainUIMember extends Sprite
   {
      
      public var redBar:ColorBar;
      
      public var blueBar:ColorBar;
      
      public var img:Bitmap;
      
      public var playerName:FLabel;
      
      public var playerLevle:FLabel;
      
      public var leaderIco:Bitmap;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public var MouseBg:Sprite;
      
      public var setup:String = "";
      
      public var hp:Number;
      
      public var hpMax:Number;
      
      public var mp:int;
      
      public var mpMax:int;
      
      public var mapName:String = "";
      
      public var xy:String = "0,0";
      
      public var isSame:Boolean;
      
      public var id:int;
      
      private var menuCanvas:FCanvas;
      
      private var menuList:FList;
      
      private var _parent:DisplayObject;
      
      private var zhiYe:int = 0;
      
      public var _aloof:Bitmap;
      
      public var zhiYeMc:DisplayObject;
      
      public var zhiYeSpr:Sprite;
      
      public function MainUIMember()
      {
         super();
         addChild(StaticValue.getMCByClassName("ui.main.team.member"));
         this.redBar = new ColorBar(1,122,7,false);
         addChild(this.redBar);
         this.redBar.x = 34;
         this.redBar.y = 21;
         this.blueBar = new ColorBar(2,122,7,false);
         addChild(this.blueBar);
         this.blueBar.x = 34;
         this.blueBar.y = 31;
         this.img = new Bitmap(new BitmapData(25,25,true,0));
         addChild(this.img);
         this.img.width = this.img.height = 25;
         this.img.x = 5;
         this.img.y = 5;
         this._aloof = StaticValue.getBitmapByClassName("ui.team.text.aloof");
         addChild(this._aloof);
         this._aloof.x = 100;
         this._aloof.visible = false;
         this.playerName = new FLabel();
         with(this.playerName)
         {
            x = 35;
            y = 2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.playerName);
         this.playerLevle = new FLabel();
         with(this.playerLevle)
         {
            x = 10;
            y = 28;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            defaultTextFormat = new TextFormat(null,11);
         }
         addChild(this.playerLevle);
         this.leaderIco = StaticValue.getBitmapByClassName("ui.main.team.leader.ico");
         addChild(this.leaderIco);
         this.leaderIco.rotation = -30;
         this.leaderIco.x = 125;
         this.leaderIco.y = 25;
         this.leaderIco.visible = false;
         this.zhiYeSpr = new Sprite();
         addChild(this.zhiYeSpr);
         ToolTips.createToolTips(this.zhiYeSpr,this,function(param1:*, param2:MouseEvent):String
         {
            var _loc3_:String = "";
            switch(zhiYe)
            {
               case 1:
                  _loc3_ = LanResManager.getLanCommonTextWords("少林派弟子");
                  break;
               case 2:
                  _loc3_ = LanResManager.getLanCommonTextWords("全真派弟子");
                  break;
               case 3:
                  _loc3_ = LanResManager.getLanCommonTextWords("古墓派弟子");
                  break;
               case 4:
                  _loc3_ = LanResManager.getLanCommonTextWords("桃花派弟子");
            }
            return _loc3_;
         });
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.MouseBg = new Sprite();
         addChild(this.MouseBg);
         this.MouseBg.graphics.lineStyle(0,0,0);
         this.MouseBg.graphics.beginFill(0,0);
         this.MouseBg.graphics.drawRect(0,0,165,43);
         this.MouseBg.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.MouseBg.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         this.menuCanvas = new FCanvas();
         this.menuCanvas.skin = "backGroud";
         this.menuList = new FList();
         this.menuList.skin = "menuList";
         this.menuCanvas.addChild(this.menuList);
         this.menuList.x = 2;
         this.menuList.y = 2;
         this.menuList.listWidth = 20;
         this.menuList.dataProvider = <list>
															 <node label={LanResManager.getLanCommonTextWords("密聊")} id="1"/>
															 <node label={LanResManager.getLanCommonTextWords("查看")} id="2"/>
															 <node label={LanResManager.getLanCommonTextWords("交友")} id="3"/>
															 <node label={LanResManager.getLanCommonTextWords("交易")} id="4"/>
															 <node label={LanResManager.getLanCommonTextWords("帮邀")} id="6"/>
															 <node label={LanResManager.getLanCommonTextWords("看摊")} id="7"/>
															 <node label={LanResManager.getLanCommonTextWords("赠花")} id="8"/>
														 </list>;
         this.menuList.addEventListener(MouseEvent.CLICK,this.onList);
         this.menuCanvas.width = this.menuList.width + 4;
         this.menuCanvas.height = this.menuList.height + 4;
      }
      
      private function onMouseTip1(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         if(param1.type == MouseEvent.CLICK)
         {
            param1.stopPropagation();
         }
         else
         {
            GameInstance.scene.sceneDispatchEvent(param1);
         }
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.MouseBg.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
               this._parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_TEAMMEMBERLIST_MOUSEOVER));
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = this.isSame ? StaticValue.GREEN_HTML : StaticValue.RED_HTML;
               _loc3_ = this.isSame ? "" : "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanTextWords(this,"组队远离描述") + "</font>";
               this.showTip(LanResManager.getLanTextWords(this,"所在地图",[StaticValue.ORANGE_HTML,this.playerName.text,StaticValue.GREEN_HTML,this.playerLevle.text,this.setup,StaticValue.GREEN_HTML,this.hp,this.hpMax,_loc2_,this.mapName,this.xy,_loc3_]));
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.MouseBg.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
               break;
            case MouseEvent.CLICK:
               this.showMenu();
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      private function showMenu() : void
      {
         Tools.currentStage.addChild(this.menuCanvas);
         this.menuCanvas.x = Tools.currentStage.mouseX;
         this.menuCanvas.y = Tools.currentStage.mouseY;
         Tools.currentStage.addEventListener(MouseEvent.CLICK,this.onStageClick);
      }
      
      private function onStageClick(param1:MouseEvent = null) : void
      {
         if(this.menuCanvas.parent != null)
         {
            this.menuCanvas.parent.removeChild(this.menuCanvas);
         }
         Tools.currentStage.removeEventListener(MouseEvent.CLICK,this.onStageClick);
      }
      
      private function onList(param1:MouseEvent) : void
      {
         this.onStageClick();
         this._parent.dispatchEvent(new BaseEvent(MainUI.CHAT_MENU_CLICK,"",[int(this.menuList.selectItem.id),this.id,this.playerName.text]));
      }
      
      public function setZhiYe(param1:Boolean, param2:int = 0) : void
      {
         while(this.zhiYeSpr.numChildren != 0)
         {
            this.zhiYeSpr.removeChildAt(0);
         }
         this.zhiYe = param2;
         if(param1)
         {
            this.zhiYeMc = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/teamico" + param2 + ".swf");
            this.zhiYeMc.x = 170;
            this.zhiYeMc.y = 10;
            this.zhiYeSpr.addChild(this.zhiYeMc);
         }
      }
   }
}

