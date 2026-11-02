package com.tgame.shell.view.components.mainui
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.mainui.smallMap.MapCutline;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.CDFaceManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import gs.TweenMax;
   
   public class SmallMap extends Sprite
   {
      
      private var allContainer:Sprite;
      
      private var bg:Sprite;
      
      private var con:Sprite;
      
      private var container:Sprite;
      
      private var map:Bitmap;
      
      private var _mask:Sprite;
      
      private var char:MapCutline;
      
      private var wuqi:MapCutline;
      
      private var ren:MapCutline;
      
      private var shen:MapCutline;
      
      private var tian:MapCutline;
      
      private var di:MapCutline;
      
      private var xiuqiu:MapCutline;
      
      private var NPCContainer:Sprite;
      
      private var taskNPCContainer:Sprite;
      
      private var funcitonNPCContainer:Sprite;
      
      private var businessNPCContainer:Sprite;
      
      private var portalContainer:Sprite;
      
      private var otherPlayerContainer:Sprite;
      
      private var teamMemberContainer:Sprite;
      
      private var monsterContainer:Sprite;
      
      private var wuqiContainer:Sprite;
      
      private var xiuqiuContainer:Sprite;
      
      private var hideBtn:FSimpleButton;
      
      private var jingBtn:FSimpleButton;
      
      private var zhanBtn:FSimpleButton;
      
      private var zhengfuBtn:FSimpleButton;
      
      private var huodongBtn:FSimpleButton;
      
      private var infoBtn:FSimpleButton;
      
      private var showHidePlayerBtn:FSimpleButton;
      
      private var openCloseSoundBtn:FSimpleButton;
      
      public var mapName:FTextArea;
      
      public var mapXY:FTextArea;
      
      public var setBtn:SmallButton;
      
      public var mapBtn:SmallButton;
      
      public var topBtn:SmallButton;
      
      public var lineBtn:SmallButton;
      
      private var buffBtn:FSimpleButton;
      
      private var buffContainer:FCanvas;
      
      private var buffItemContainer:Sprite;
      
      private var buffItemContainer1:Sprite;
      
      private var buffBgContainer:Sprite;
      
      private var buffBgContainer1:Sprite;
      
      private var buffMask:Sprite;
      
      private var buffTitle1:FLabel;
      
      private var buffTitle2:FLabel;
      
      private var buffMask1:Sprite;
      
      private var buffContainer1:Sprite;
      
      private var showBuffBtn1:SecondButton;
      
      private var showBuffBtn2:SecondButton;
      
      private var closeBuffBtn:SecondButton;
      
      private var buffArr:Array;
      
      private var buffArr1:Array;
      
      private var jingTime:int;
      
      private var jingtTimer:Timer;
      
      private var qi3v3Dict:Dictionary = new Dictionary();
      
      private var _loader:Loader;
      
      private var _timer:Timer;
      
      public function SmallMap()
      {
         super();
         this.initUI();
         this.initMap();
      }
      
      private function initUI() : void
      {
         var tf:TextFormat;
         addChild(StaticValue.getMCByClassName("ui.main.map.bar"));
         this.allContainer = new Sprite();
         addChild(this.allContainer);
         this.bg = StaticValue.getMCByClassName("ui.main.map.bg");
         this.allContainer.addChildAt(this.bg,0);
         this.buffArr = [];
         this.buffArr1 = [];
         this.buffContainer = new FCanvas();
         this.buffContainer.skin = "menuBg";
         addChild(this.buffContainer);
         this.buffContainer.width = 210;
         this.buffContainer.x = 210;
         this.buffBgContainer = new Sprite();
         this.buffContainer.addChild(this.buffBgContainer);
         this.buffBgContainer1 = new Sprite();
         this.buffContainer.addChild(this.buffBgContainer1);
         this.buffItemContainer = new Sprite();
         this.buffContainer.addChild(this.buffItemContainer);
         this.buffItemContainer1 = new Sprite();
         this.buffContainer.addChild(this.buffItemContainer1);
         this.buffMask = new Sprite();
         with(this.buffMask)
         {
            graphics.beginFill(0);
            graphics.drawRect(0,0,210,400);
            graphics.endFill();
            x = -210;
            y = 0;
         }
         addChild(this.buffMask);
         this.buffContainer.mask = this.buffMask;
         this.buffContainer1 = new Sprite();
         addChild(this.buffContainer1);
         this.buffContainer1.x = -210;
         this.buffMask1 = new Sprite();
         with(this.buffMask1)
         {
            graphics.beginFill(0);
            graphics.drawRect(0,0,210,400);
            graphics.endFill();
            x = -210;
            y = 0;
         }
         addChild(this.buffMask1);
         this.buffContainer1.mask = this.buffMask1;
         this.buffTitle1 = new FLabel();
         with(this.buffTitle1)
         {
            x = 30;
            y = 5;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("当前已获得状态加成");
         }
         this.buffContainer.addChild(this.buffTitle1);
         this.buffTitle2 = new FLabel();
         with(this.buffTitle2)
         {
            x = 30;
            y = 5;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("尚未获得的状态加成");
         }
         this.buffContainer.addChild(this.buffTitle2);
         this.showBuffBtn1 = new SecondButton();
         addChild(this.showBuffBtn1);
         this.showBuffBtn1.label = LanResManager.getLanCommonTextWords("显示已获BUFF");
         this.showBuffBtn1.x = -this.showBuffBtn1.width;
         this.showBuffBtn1.y = 0;
         this.showBuffBtn1.visible = false;
         this.showBuffBtn1.addEventListener(MouseEvent.CLICK,this.onBuffBtnClick);
         this.showBuffBtn2 = new SecondButton();
         addChild(this.showBuffBtn2);
         this.showBuffBtn2.label = LanResManager.getLanCommonTextWords("展开BUFF列表");
         this.showBuffBtn2.x = -this.showBuffBtn2.width;
         this.showBuffBtn2.y = this.showBuffBtn1.height;
         this.showBuffBtn2.visible = false;
         this.showBuffBtn2.addEventListener(MouseEvent.CLICK,this.onBuffBtnClick);
         this.closeBuffBtn = new SecondButton();
         addChild(this.closeBuffBtn);
         this.closeBuffBtn.label = LanResManager.getLanCommonTextWords("隐藏BUFF列表");
         this.closeBuffBtn.x = -this.closeBuffBtn.width;
         this.closeBuffBtn.y = this.showBuffBtn2.y + this.showBuffBtn2.height;
         this.closeBuffBtn.visible = false;
         this.closeBuffBtn.addEventListener(MouseEvent.CLICK,this.onBuffBtnClick);
         tf = new TextFormat();
         tf.align = "center";
         this.mapXY = new FTextArea();
         with(this.mapXY)
         {
            filters = StaticValue.filter;
            width = 50;
            height = 18;
            x = 38;
            y = 4;
            textColor = StaticValue.BLUE;
            defaultTextFormat = tf;
            text = "100:100";
         }
         addChild(this.mapXY);
         this.mapName = new FTextArea();
         with(this.mapName)
         {
            filters = StaticValue.filter;
            width = 108;
            height = 18;
            x = 80;
            y = 4;
            textColor = StaticValue.WHITE;
            defaultTextFormat = tf;
            text = "";
         }
         addChild(this.mapName);
         this.buffBtn = new FSimpleButton();
         this.buffBtn.skin = "buffShowBtn";
         addChild(this.buffBtn);
         this.buffBtn.addEventListener(MouseEvent.CLICK,this.onBuffBtnClick);
         this.zhengfuBtn = new FSimpleButton();
         this.zhengfuBtn.skin = "zhengfuButton";
         this.zhengfuBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("查看“跨服擂台与战场信息”") + "</font>";
         this.allContainer.addChild(this.zhengfuBtn);
         this.zhengfuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.huodongBtn = new FSimpleButton();
         this.huodongBtn.skin = "huodongButton";
         this.huodongBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("查看“野外BOSS刷新信息与爆率”") + "<br>" + LanResManager.getLanCommonTextWords("查看“每日活动”“副本”与“奖励”信息") + "</font>";
         this.allContainer.addChild(this.huodongBtn);
         this.huodongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.infoBtn = new FSimpleButton();
         this.infoBtn.skin = "infoButton";
         this.infoBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("查看“服务器历史公告信息”") + "<br>" + LanResManager.getLanCommonTextWords("查看“今日的收益统计”") + "</font>";
         this.allContainer.addChild(this.infoBtn);
         this.infoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.showHidePlayerBtn = new FSimpleButton();
         this.showHidePlayerBtn.skin = "showPlayerButton";
         this.showHidePlayerBtn.toolTip = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击后将“显示”或“隐藏”其他玩家的造型与名字") + "<br>" + LanResManager.getLanCommonTextWords("若您的机器较卡，则推荐隐藏其他玩家造型可获得流畅游戏的效果") + "<br></font><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("若仅需单独“显/隐”其他玩家的造型，可使用快捷键：E") + "<br>" + LanResManager.getLanCommonTextWords("若仅需单独“显/隐”其他玩家的名字，可使用快捷键：I") + "</font>";
         this.allContainer.addChild(this.showHidePlayerBtn);
         this.showHidePlayerBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.openCloseSoundBtn = new FSimpleButton();
         this.openCloseSoundBtn.skin = "openSoundButton";
         this.openCloseSoundBtn.toolTip = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击后将“开启”或“关闭”背景音乐与动作音效") + "<br></font><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("若仅需单独“开/关”背景音乐，可使用快捷键：Y") + "<br>" + LanResManager.getLanCommonTextWords("若仅需单独“开/关”动作音效，可使用快捷键：CTRL+Y") + "</font>";
         this.allContainer.addChild(this.openCloseSoundBtn);
         this.openCloseSoundBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.hideBtn = new FSimpleButton();
         this.hideBtn.skin = "hideButton";
         this.hideBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("折叠/展开雷达地图显示栏") + "</font>";
         addChild(this.hideBtn);
         this.hideBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jingBtn = new FSimpleButton();
         this.jingBtn.skin = "jingBtn";
         addChild(this.jingBtn);
         this.jingBtn.visible = false;
         this.jingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jingtTimer = new Timer(1000,4000);
         this.jingtTimer.addEventListener("timer",this.jingTimeFun);
         this.zhanBtn = new FSimpleButton();
         this.zhanBtn.skin = "zhanchangBtn";
         addChild(this.zhanBtn);
         this.zhanBtn.visible = false;
         this.zhanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zhengfuBtn.x = 56 - this.zhengfuBtn.width;
         this.zhengfuBtn.y = 24;
         this.huodongBtn.x = 56 - this.huodongBtn.width;
         this.huodongBtn.y = this.zhengfuBtn.y + this.zhengfuBtn.height + 2;
         this.infoBtn.x = 56 - this.infoBtn.width;
         this.infoBtn.y = this.huodongBtn.y + this.huodongBtn.height;
         this.showHidePlayerBtn.x = 56 - this.showHidePlayerBtn.width;
         this.showHidePlayerBtn.y = this.infoBtn.y + this.infoBtn.height;
         this.openCloseSoundBtn.x = 56 - this.openCloseSoundBtn.width;
         this.openCloseSoundBtn.y = this.showHidePlayerBtn.y + this.showHidePlayerBtn.height;
         this.hideBtn.x = 209 - this.hideBtn.width - 3;
         this.hideBtn.y = 3;
         this.jingBtn.x = this.zhengfuBtn.x - this.jingBtn.width;
         this.jingBtn.y = this.zhengfuBtn.y;
         this.zhanBtn.x = this.jingBtn.x - 10;
         this.zhanBtn.y = this.jingBtn.y;
         this.setBtn = new SmallButton();
         this.setBtn.color = StaticValue.ORANGE;
         this.setBtn.label = LanResManager.getLanCommonTextWords("设置");
         this.setBtn.toolTip = "";
         this.setBtn.x = 60;
         this.setBtn.y = 156;
         this.setBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.mapBtn = new SmallButton();
         this.mapBtn.color = StaticValue.ORANGE;
         this.mapBtn.label = LanResManager.getLanCommonTextWords("地 图");
         this.mapBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("查看当前地图与世界地图") + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'>（M）</font>";
         this.allContainer.addChild(this.mapBtn);
         this.mapBtn.x = 75 + 14 + 9 - 30;
         this.mapBtn.y = 156;
         this.mapBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.topBtn = new SmallButton();
         this.topBtn.color = StaticValue.ORANGE;
         this.topBtn.label = LanResManager.getLanCommonTextWords("排 行");
         this.topBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("查看排行榜信息") + "</font><font color=\'" + StaticValue.GREEN_HTML + "\'>（K）</font>";
         this.allContainer.addChild(this.topBtn);
         this.topBtn.x = 117 + 14 + 9 - 15;
         this.topBtn.y = 156;
         this.topBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lineBtn = new SmallButton();
         this.lineBtn.color = StaticValue.ORANGE;
         this.lineBtn.label = "";
         this.lineBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击后可切换至其他线路") + "<br><font color=\'" + StaticValue.GREEN + "\'>" + LanResManager.getLanCommonTextWords("线路依照在线人数排序") + "<br>" + LanResManager.getLanCommonTextWords("排序越靠下的线路将会越拥挤") + "<br>" + LanResManager.getLanCommonTextWords("我们推荐您进入较为顺畅的线路") + "</font></font>";
         this.allContainer.addChild(this.lineBtn);
         this.lineBtn.x = 159 + 14;
         this.lineBtn.y = 156;
         this.lineBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function initMap() : void
      {
         this.con = new Sprite();
         with(this.con)
         {
            graphics.beginFill(0,1);
            graphics.drawRect(0,0,142,124);
            graphics.endFill();
         }
         this.allContainer.addChildAt(this.con,0);
         this.con.x = 62;
         this.con.y = 25;
         this.container = new Sprite();
         this.con.addChild(this.container);
         this._mask = new Sprite();
         addChild(this._mask);
         with(this._mask)
         {
            graphics.beginFill(16711935,1);
            graphics.drawRect(62,25,142,124);
            graphics.endFill();
         }
         this.container.mask = this._mask;
         this.map = new Bitmap();
         this.map.cacheAsBitmap = true;
         this.container.addChild(this.map);
         this.char = new MapCutline(2);
         this.con.addChild(this.char);
         this.char.x = 71;
         this.char.y = 62;
         this.portalContainer = new Sprite();
         this.container.addChild(this.portalContainer);
         this.NPCContainer = new Sprite();
         this.container.addChild(this.NPCContainer);
         this.businessNPCContainer = new Sprite();
         this.container.addChild(this.businessNPCContainer);
         this.taskNPCContainer = new Sprite();
         this.container.addChild(this.taskNPCContainer);
         this.funcitonNPCContainer = new Sprite();
         this.container.addChild(this.funcitonNPCContainer);
         this.otherPlayerContainer = new Sprite();
         this.container.addChild(this.otherPlayerContainer);
         this.teamMemberContainer = new Sprite();
         this.container.addChild(this.teamMemberContainer);
         this.monsterContainer = new Sprite();
         this.container.addChild(this.monsterContainer);
         this.wuqiContainer = new Sprite();
         this.container.addChild(this.wuqiContainer);
         this.wuqi = new MapCutline(11,{
            "name":LanResManager.getLanCommonTextWords("游龙之刃"),
            "xy":new Point()
         });
         this.wuqiContainer.addChild(this.wuqi);
         this.wuqi.visible = false;
         this.ren = new MapCutline(12,{
            "name":LanResManager.getLanCommonTextWords("轩辕人剑"),
            "xy":new Point()
         });
         this.shen = new MapCutline(13,{
            "name":LanResManager.getLanCommonTextWords("轩辕神剑"),
            "xy":new Point()
         });
         this.tian = new MapCutline(14,{
            "name":LanResManager.getLanCommonTextWords("轩辕天剑"),
            "xy":new Point()
         });
         this.di = new MapCutline(15,{
            "name":LanResManager.getLanCommonTextWords("轩辕地剑"),
            "xy":new Point()
         });
         this.xiuqiuContainer = new Sprite();
         this.container.addChild(this.xiuqiuContainer);
         this.xiuqiu = new MapCutline(20,{
            "name":LanResManager.getLanCommonTextWords("绣球"),
            "xy":new Point()
         });
         this.xiuqiuContainer.addChild(this.xiuqiu);
         this.xiuqiu.visible = false;
      }
      
      private function onBuffBtnClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.buffBtn:
               this.showBuffBtn1.visible = !this.showBuffBtn1.visible;
               this.showBuffBtn2.visible = !this.showBuffBtn2.visible;
               this.closeBuffBtn.visible = !this.closeBuffBtn.visible;
               break;
            case this.showBuffBtn1:
               this.showBuffBtn1.visible = false;
               this.showBuffBtn2.visible = false;
               this.closeBuffBtn.visible = false;
               this.changeBuffContainer(1);
               break;
            case this.showBuffBtn2:
               this.showBuffBtn1.visible = false;
               this.showBuffBtn2.visible = false;
               this.closeBuffBtn.visible = false;
               this.changeBuffContainer(2);
               break;
            case this.closeBuffBtn:
               this.showBuffBtn1.visible = false;
               this.showBuffBtn2.visible = false;
               this.closeBuffBtn.visible = false;
               this.changeBuffContainer(3);
         }
      }
      
      private function changeBuffContainer(param1:int) : void
      {
         switch(param1)
         {
            case 1:
               addChildAt(this.buffContainer1,0);
               TweenMax.to(this.buffContainer,1,{
                  "x":0,
                  "onComplete":this.onCom
               });
               TweenMax.to(this.buffContainer1,1,{"x":-210});
               break;
            case 2:
               addChildAt(this.buffContainer,0);
               TweenMax.to(this.buffContainer,1,{"x":-210});
               TweenMax.to(this.buffContainer1,1,{
                  "x":0,
                  "onComplete":this.onCom1
               });
               break;
            case 3:
               TweenMax.to(this.buffContainer,1,{
                  "x":0,
                  "onComplete":this.onCom
               });
               TweenMax.to(this.buffContainer1,1,{
                  "x":0,
                  "onComplete":this.onCom1
               });
         }
      }
      
      private function onCom() : void
      {
         if(this.buffContainer.parent)
         {
            this.buffContainer.parent.removeChild(this.buffContainer);
         }
      }
      
      private function onCom1() : void
      {
         if(this.buffContainer1.parent)
         {
            this.buffContainer1.parent.removeChild(this.buffContainer1);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         switch(param1.target)
         {
            case this.huodongBtn:
               parent.dispatchEvent(new BaseEvent(MainUI.MAP_HUODONG_BTN_CLICK));
               break;
            case this.zhengfuBtn:
               parent.dispatchEvent(new BaseEvent(MainUI.MAP_ZHENGFU_BTN_CLICK));
               break;
            case this.infoBtn:
               parent.dispatchEvent(new BaseEvent(MainUI.MAP_INFO_BTN_CLICK));
               break;
            case this.showHidePlayerBtn:
               if(this.showHidePlayerBtn.skin == "hidePlayerButton")
               {
                  _loc2_ = 1;
               }
               else
               {
                  _loc2_ = 0;
               }
               parent.dispatchEvent(new BaseEvent(MainUI.MAP_CHANGEOTHERCHARNAMESHOWBTN_CLICK,"",_loc2_));
               break;
            case this.openCloseSoundBtn:
               if(this.openCloseSoundBtn.skin == "closeSoundButton")
               {
                  _loc3_ = 1;
               }
               else
               {
                  _loc3_ = 0;
               }
               parent.dispatchEvent(new BaseEvent(MainUI.MAP_OPTIONBTN_CLICK,"",_loc3_));
               break;
            case this.mapBtn:
               parent.dispatchEvent(new BaseEvent(MainUI.MAP_MAPBTN_CLICK));
               break;
            case this.topBtn:
               parent.dispatchEvent(new BaseEvent(MainUI.MAP_TOPBTN_CLICK));
               break;
            case this.lineBtn:
               parent.dispatchEvent(new BaseEvent(MainUI.MAP_LINEBTN_CLICK,"",param1));
               break;
            case this.hideBtn:
               this.allContainer.visible = !this.allContainer.visible;
               break;
            case this.jingBtn:
               parent.dispatchEvent(new BaseEvent(MainUI.MAP_JING_CLICK));
               break;
            case this.zhanBtn:
               parent.dispatchEvent(new BaseEvent(MainUI.MAP_ZHAN_CLICK));
         }
      }
      
      public function setSoundBtnSkin(param1:Boolean) : void
      {
         if(param1)
         {
            this.openCloseSoundBtn.skin = "closeSoundButton";
         }
         else
         {
            this.openCloseSoundBtn.skin = "openSoundButton";
         }
      }
      
      public function setPlayerShowBtnSkin(param1:Boolean) : void
      {
         if(param1)
         {
            this.showHidePlayerBtn.skin = "hidePlayerButton";
         }
         else
         {
            this.showHidePlayerBtn.skin = "showPlayerButton";
         }
      }
      
      public function setCharXY(param1:Point) : void
      {
         var _loc4_:Point = null;
         this.mapXY.text = int(param1.x / 25) + ":" + int(param1.y / 25);
         var _loc2_:Number = this._mask.width / 2;
         var _loc3_:Number = this._mask.height / 2;
         if(GameInstance.scene.mapConfig)
         {
            _loc4_ = new Point(param1.x * GameInstance.scene.mapConfig.widthScale,param1.y * GameInstance.scene.mapConfig.heightScale);
            if(_loc4_.x < _loc2_ || _loc4_.x > this.map.width - _loc2_ || _loc4_.y < _loc3_ || _loc4_.y > this.map.height - _loc3_)
            {
               if(_loc4_.x < _loc2_)
               {
                  this.char.x = _loc4_.x;
                  this.container.y = -(_loc4_.y - _loc3_);
                  this.container.x = 0;
               }
               if(_loc4_.x > this.map.width - _loc2_)
               {
                  this.char.x = _loc2_ + _loc4_.x - (this.map.width - _loc2_);
                  this.container.x = -(this.map.width - 2 * _loc2_);
                  this.container.y = -(_loc4_.y - _loc3_);
               }
               if(_loc4_.y < _loc3_)
               {
                  this.char.y = _loc4_.y;
                  this.container.x = -(_loc4_.x - _loc2_);
                  this.container.y = 0;
               }
               if(_loc4_.y > this.map.height - _loc3_)
               {
                  this.char.y = _loc3_ + _loc4_.y - (this.map.height - _loc3_);
                  this.container.x = -(_loc4_.x - _loc2_);
                  this.container.y = -(this.map.height - 2 * _loc3_);
               }
               if(_loc4_.x < _loc2_ && _loc4_.y < _loc3_)
               {
                  this.char.x = _loc4_.x;
                  this.char.y = _loc4_.y;
                  this.container.x = 0;
                  this.container.y = 0;
               }
               if(_loc4_.x > this.map.width - _loc2_ && _loc4_.y < _loc3_)
               {
                  this.char.x = _loc2_ + _loc4_.x - (this.map.width - _loc2_);
                  this.char.y = _loc4_.y;
                  this.container.x = -(this.map.width - 2 * _loc2_);
                  this.container.y = 0;
               }
               if(_loc4_.x > this.map.width - _loc2_ && _loc4_.y > this.map.height - _loc3_)
               {
                  this.char.x = _loc2_ + _loc4_.x - (this.map.width - _loc2_);
                  this.char.y = _loc3_ + _loc4_.y - (this.map.height - _loc3_);
                  this.container.x = -(this.map.width - 2 * _loc2_);
                  this.container.y = -(this.map.height - 2 * _loc3_);
               }
               if(_loc4_.x < _loc2_ && _loc4_.y > this.map.height - _loc3_)
               {
                  this.char.x = _loc4_.x;
                  this.char.y = _loc3_ + _loc4_.y - (this.map.height - _loc3_);
                  this.container.x = 0;
                  this.container.y = -(this.map.height - 2 * _loc3_);
               }
            }
            else
            {
               this.char.x = _loc2_;
               this.char.y = _loc3_;
               this.container.x = -(_loc4_.x - _loc2_);
               this.container.y = -(_loc4_.y - _loc3_);
            }
         }
      }
      
      public function setCharDirection(param1:int) : void
      {
         this.char.rotation = 180 + param1 * 45;
      }
      
      public function setMap(param1:BitmapData) : void
      {
         this.map.bitmapData = param1;
      }
      
      public function setOtherPlayer(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MapCutline = null;
         while(this.otherPlayerContainer.numChildren > 0)
         {
            this.otherPlayerContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new MapCutline(3,param1[_loc2_]);
            this.otherPlayerContainer.addChild(_loc4_);
            if(GameInstance.scene.mapConfig)
            {
               _loc4_.x = param1[_loc2_].xy.x * GameInstance.scene.mapConfig.widthScale;
               _loc4_.y = param1[_loc2_].xy.y * GameInstance.scene.mapConfig.heightScale;
            }
            _loc2_++;
         }
      }
      
      public function setTeamMebmer(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MapCutline = null;
         while(this.teamMemberContainer.numChildren > 0)
         {
            this.teamMemberContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new MapCutline(4,param1[_loc2_]);
            this.teamMemberContainer.addChild(_loc4_);
            if(GameInstance.scene.mapConfig)
            {
               _loc4_.x = param1[_loc2_].xy.x * GameInstance.scene.mapConfig.widthScale;
               _loc4_.y = param1[_loc2_].xy.y * GameInstance.scene.mapConfig.heightScale;
            }
            _loc2_++;
         }
      }
      
      public function setMonster(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MapCutline = null;
         while(this.monsterContainer.numChildren > 0)
         {
            this.monsterContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(Boolean(param1[_loc2_].zhenyingID) && param1[_loc2_].zhenyingID == GameInstance.mainCharData.attributeInfo.zhenyingID)
            {
               _loc4_ = new MapCutline(3,param1[_loc2_]);
            }
            else
            {
               _loc4_ = new MapCutline(5,param1[_loc2_]);
            }
            this.monsterContainer.addChild(_loc4_);
            if(GameInstance.scene.mapConfig)
            {
               _loc4_.x = param1[_loc2_].xy.x * GameInstance.scene.mapConfig.widthScale;
               _loc4_.y = param1[_loc2_].xy.y * GameInstance.scene.mapConfig.heightScale;
            }
            _loc2_++;
         }
      }
      
      public function setNPC(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MapCutline = null;
         while(this.NPCContainer.numChildren > 0)
         {
            this.NPCContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new MapCutline(1,param1[_loc2_]);
            this.NPCContainer.addChild(_loc4_);
            if(GameInstance.scene.mapConfig)
            {
               _loc4_.x = param1[_loc2_].xy.x * GameInstance.scene.mapConfig.widthScale;
               _loc4_.y = param1[_loc2_].xy.y * GameInstance.scene.mapConfig.heightScale;
            }
            _loc2_++;
         }
      }
      
      public function setBusinessNPC(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MapCutline = null;
         while(this.businessNPCContainer.numChildren > 0)
         {
            this.businessNPCContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new MapCutline(6,param1[_loc2_]);
            this.businessNPCContainer.addChild(_loc4_);
            if(GameInstance.scene.mapConfig)
            {
               _loc4_.x = param1[_loc2_].xy.x * GameInstance.scene.mapConfig.widthScale;
               _loc4_.y = param1[_loc2_].xy.y * GameInstance.scene.mapConfig.heightScale;
            }
            _loc2_++;
         }
      }
      
      public function setTaskNPC(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MapCutline = null;
         while(this.taskNPCContainer.numChildren > 0)
         {
            this.taskNPCContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new MapCutline(6,param1[_loc2_]);
            this.taskNPCContainer.addChild(_loc4_);
            if(GameInstance.scene.mapConfig)
            {
               _loc4_.x = param1[_loc2_].xy.x * GameInstance.scene.mapConfig.widthScale;
               _loc4_.y = param1[_loc2_].xy.y * GameInstance.scene.mapConfig.heightScale;
            }
            _loc2_++;
         }
      }
      
      public function setFunctionNPC(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MapCutline = null;
         while(this.funcitonNPCContainer.numChildren > 0)
         {
            this.funcitonNPCContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new MapCutline(6,param1[_loc2_]);
            this.funcitonNPCContainer.addChild(_loc4_);
            if(GameInstance.scene.mapConfig)
            {
               _loc4_.x = param1[_loc2_].xy.x * GameInstance.scene.mapConfig.widthScale;
               _loc4_.y = param1[_loc2_].xy.y * GameInstance.scene.mapConfig.heightScale;
            }
            _loc2_++;
         }
      }
      
      public function setPortal(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MapCutline = null;
         while(this.portalContainer.numChildren > 0)
         {
            this.portalContainer.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new MapCutline(0,param1[_loc2_]);
            this.portalContainer.addChild(_loc4_);
            if(GameInstance.scene.mapConfig)
            {
               _loc4_.x = param1[_loc2_].xy.x * GameInstance.scene.mapConfig.widthScale;
               _loc4_.y = param1[_loc2_].xy.y * GameInstance.scene.mapConfig.heightScale;
            }
            _loc2_++;
         }
      }
      
      public function setTaskState(param1:Array, param2:Array, param3:Array) : void
      {
         var _loc4_:int = 0;
         var _loc6_:MapCutline = null;
         var _loc5_:int = this.taskNPCContainer.numChildren;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = this.taskNPCContainer.getChildAt(_loc4_) as MapCutline;
            if(param1.indexOf(_loc6_.id) !== -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_ABLE);
            }
            else if(param2.indexOf(_loc6_.id) != -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_ING);
            }
            else if(param3.indexOf(_loc6_.id) != -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_COMPLETE);
            }
            else
            {
               _loc6_.setType();
            }
            _loc4_++;
         }
         _loc5_ = this.funcitonNPCContainer.numChildren;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = this.funcitonNPCContainer.getChildAt(_loc4_) as MapCutline;
            if(param1.indexOf(_loc6_.id) !== -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_ABLE);
            }
            else if(param2.indexOf(_loc6_.id) != -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_ING);
            }
            else if(param3.indexOf(_loc6_.id) != -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_COMPLETE);
            }
            else
            {
               _loc6_.setType();
            }
            _loc4_++;
         }
         _loc5_ = this.businessNPCContainer.numChildren;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = this.businessNPCContainer.getChildAt(_loc4_) as MapCutline;
            if(param1.indexOf(_loc6_.id) !== -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_ABLE);
            }
            else if(param2.indexOf(_loc6_.id) != -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_ING);
            }
            else if(param3.indexOf(_loc6_.id) != -1)
            {
               _loc6_.setType(MapCutline.TYPE_TASK_COMPLETE);
            }
            else
            {
               _loc6_.setType();
            }
            _loc4_++;
         }
      }
      
      public function setWuQi(param1:Object) : void
      {
         if(!param1)
         {
            this.wuqi.visible = false;
         }
         else
         {
            this.wuqi.visible = true;
            if(GameInstance.scene.mapConfig)
            {
               this.wuqi.x = param1.xy.x * GameInstance.scene.mapConfig.widthScale;
               this.wuqi.y = param1.xy.y * GameInstance.scene.mapConfig.heightScale;
            }
         }
      }
      
      public function setXiuQiu(param1:Object) : void
      {
         if(!param1)
         {
            this.xiuqiu.visible = false;
         }
         else
         {
            this.xiuqiu.visible = true;
            if(GameInstance.scene.mapConfig)
            {
               this.xiuqiu.x = param1.xy.x * GameInstance.scene.mapConfig.widthScale;
               this.xiuqiu.y = param1.xy.y * GameInstance.scene.mapConfig.heightScale;
            }
         }
      }
      
      public function setRenShenTianDi(param1:Array) : void
      {
         var _loc4_:MapCutline = null;
         var _loc2_:Array = [this.ren,this.shen,this.tian,this.di];
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            _loc4_ = _loc2_[_loc3_];
            if(param1[_loc3_] != null)
            {
               _loc4_.x = param1[_loc3_].xy.x * GameInstance.scene.mapConfig.widthScale;
               _loc4_.y = param1[_loc3_].xy.y * GameInstance.scene.mapConfig.heightScale;
               if(_loc4_.parent != this.wuqiContainer)
               {
                  this.wuqiContainer.addChild(_loc4_);
               }
            }
            else if(_loc4_.parent != null)
            {
               _loc4_.parent.removeChild(_loc4_);
            }
            _loc3_++;
         }
      }
      
      public function setRenShenTianDi3v3(param1:Array) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:MapCutline = null;
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         if(param1 == null || param1.length == 0)
         {
            for(_loc4_ in this.qi3v3Dict)
            {
               _loc5_ = this.qi3v3Dict[_loc4_];
               if(_loc5_.parent != null)
               {
                  _loc5_.parent.removeChild(_loc5_);
               }
               delete this.qi3v3Dict[_loc4_];
            }
            return;
         }
         var _loc2_:int = int(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc6_ = param1[_loc3_];
            _loc7_ = 16;
            if(_loc6_.type == 1)
            {
               _loc7_ = 17;
            }
            else if(_loc6_.type == 2)
            {
               _loc7_ = 18;
            }
            _loc5_ = this.qi3v3Dict[_loc6_.id];
            if(_loc5_ == null)
            {
               _loc5_ = new MapCutline(_loc7_,_loc6_);
               this.qi3v3Dict[_loc6_.id] = _loc5_;
            }
            else
            {
               _loc5_.changeType(_loc7_);
               _loc5_.changeData(_loc6_);
            }
            _loc5_.x = _loc6_.xy.x * GameInstance.scene.mapConfig.widthScale;
            _loc5_.y = _loc6_.xy.y * GameInstance.scene.mapConfig.heightScale;
            if(_loc5_.parent != this.wuqiContainer)
            {
               this.wuqiContainer.addChild(_loc5_);
            }
            _loc3_++;
         }
      }
      
      private function setBuff1(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:int = 0;
         var _loc6_:Buff = null;
         while(this.buffContainer1.numChildren > 0)
         {
            _loc2_ = this.buffContainer1.getChildAt(0) as ItemFace;
            this.buffContainer1.removeChildAt(0);
            CDFaceManager.removeItemFace(_loc2_);
            _loc2_.destroy();
         }
         var _loc4_:* = 0;
         var _loc5_:int = int(param1.length);
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc6_ = param1[_loc3_] as Buff;
            _loc2_ = new ItemFace(_loc6_);
            this.buffContainer1.addChild(_loc2_);
            _loc2_.y = Math.floor(_loc4_ / 5) * 37;
            _loc2_.x = _loc4_++ % 5 * 37;
            CDFaceManager.registerItemFace(_loc2_);
            _loc3_++;
         }
      }
      
      public function addBuff(param1:Buff, param2:Array = null) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Bitmap = null;
         var _loc7_:Buff = null;
         if(OtherConst.YN_DIANFENGSHOU_BUFFTYPE_ARR.indexOf(param1.res.type) != -1)
         {
            return;
         }
         var _loc3_:ItemFace = new ItemFace(param1);
         var _loc4_:int = int(this.buffArr.length);
         if(_loc4_ % 5 == 0)
         {
            _loc5_ = 0;
            while(_loc5_ < 5)
            {
               _loc6_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.buffBgContainer.addChild(_loc6_);
               _loc6_.x = _loc5_ * 40 + 5;
               _loc6_.y = _loc4_ / 5 * 40 + this.buffTitle1.y + 20;
               _loc5_++;
            }
         }
         this.buffItemContainer.addChild(_loc3_);
         _loc3_.y = Math.floor(_loc4_ / 5) * 40 + this.buffTitle1.y + 22;
         _loc3_.x = _loc4_ % 5 * 40 + 7;
         this.buffArr.push(_loc3_);
         this.buffTitle2.y = this.buffTitle1.y + 20 + this.buffBgContainer.height;
         this.buffBgContainer1.y = this.buffTitle2.y + 25;
         this.buffItemContainer1.y = this.buffTitle2.y + 27;
         if(param2)
         {
            _loc5_ = 0;
            while(_loc5_ < 5)
            {
               _loc6_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.buffBgContainer1.addChild(_loc6_);
               _loc6_.x = _loc5_ * 40 + 5;
               _loc5_++;
            }
            while(this.buffItemContainer1.numChildren > 0)
            {
               this.buffItemContainer1.removeChildAt(0);
            }
            _loc4_ = int(param2.length);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc7_ = param2[_loc5_] as Buff;
               _loc3_ = new ItemFace(_loc7_);
               this.buffItemContainer1.addChild(_loc3_);
               _loc3_.x = _loc5_ * 40 + 7;
               _loc3_.filters = Tools.blackWhiteFilter;
               _loc5_++;
            }
         }
         this.buffContainer.height = this.buffTitle2.y + 75;
         _loc3_ = new ItemFace(param1);
         _loc4_ = int(this.buffArr1.length);
         this.buffContainer1.addChild(_loc3_);
         _loc3_.y = Math.floor(_loc4_ / 5) * 37;
         _loc3_.x = _loc4_ % 5 * 37;
         this.buffArr1.push(_loc3_);
      }
      
      public function delAll() : void
      {
         while(this.buffArr1.length > 0)
         {
            this.delBuff((this.buffArr1[0] as ItemFace).getBaseItem().id,[]);
         }
      }
      
      public function delBuff(param1:int, param2:Array = null) : void
      {
         var _loc3_:int = 0;
         var _loc5_:ItemFace = null;
         var _loc6_:Bitmap = null;
         var _loc7_:Buff = null;
         var _loc4_:int = int(this.buffArr1.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = this.buffArr1[_loc3_] as ItemFace;
            if(_loc5_.getBaseItem().id == param1)
            {
               this.buffArr1[_loc4_ - 1].x = _loc5_.x;
               this.buffArr1[_loc4_ - 1].y = _loc5_.y;
               this.buffContainer1.removeChild(_loc5_);
               CDFaceManager.removeItemFace(_loc5_);
               _loc5_.destroy();
               this.buffArr1.splice(_loc3_,1);
               if(_loc4_ != 1)
               {
                  this.buffArr1.splice(_loc3_,0,this.buffArr1.pop());
               }
               break;
            }
            _loc3_++;
         }
         _loc4_ = int(this.buffArr.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = this.buffArr[_loc3_] as ItemFace;
            if(_loc5_.getBaseItem().id == param1)
            {
               this.buffArr[_loc4_ - 1].x = _loc5_.x;
               this.buffArr[_loc4_ - 1].y = _loc5_.y;
               this.buffItemContainer.removeChild(_loc5_);
               CDFaceManager.removeItemFace(_loc5_);
               _loc5_.destroy();
               this.buffArr.splice(_loc3_,1);
               if(_loc4_ != 1)
               {
                  this.buffArr.splice(_loc3_,0,this.buffArr.pop());
               }
               if(_loc4_ % 5 == 1 && _loc4_ != 1)
               {
                  while(this.buffBgContainer.numChildren > _loc4_ - 1)
                  {
                     this.buffBgContainer.removeChildAt(this.buffBgContainer.numChildren - 1);
                  }
                  this.buffTitle2.y = this.buffTitle1.y + 20 + this.buffBgContainer.height;
               }
               break;
            }
            _loc3_++;
         }
         this.buffBgContainer1.y = this.buffTitle2.y + 25;
         this.buffItemContainer1.y = this.buffTitle2.y + 27;
         if(param2)
         {
            _loc3_ = 0;
            while(_loc3_ < 5)
            {
               _loc6_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.buffBgContainer1.addChild(_loc6_);
               _loc6_.x = _loc3_ * 40 + 5;
               _loc3_++;
            }
            _loc4_ = int(param2.length);
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               _loc7_ = param2[_loc3_] as Buff;
               _loc5_ = new ItemFace(_loc7_);
               this.buffItemContainer1.addChild(_loc5_);
               _loc5_.x = _loc3_ * 40 + 7;
               _loc5_.filters = Tools.blackWhiteFilter;
               _loc3_++;
            }
         }
         this.buffContainer.height = this.buffTitle2.y + 75;
      }
      
      public function setBuff(param1:Array, param2:Array) : void
      {
         var _loc4_:int = 0;
         var _loc6_:Buff = null;
         var _loc7_:ItemFace = null;
         var _loc8_:* = 0;
         var _loc9_:Bitmap = null;
         if(!param2)
         {
            return;
         }
         var _loc3_:Array = [];
         var _loc5_:int = int(param1.length);
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = param1[_loc4_] as Buff;
            if(_loc6_.res.buff_flag == 0 || _loc6_.res.buff_flag == 2 || _loc6_.res.buff_flag == 3 || _loc6_.res.id_kind == OtherConst.PROTECT_BUFF_ID)
            {
               _loc3_.push(_loc6_);
            }
            _loc4_++;
         }
         this.setBuff1(_loc3_);
         while(this.buffItemContainer.numChildren > 0)
         {
            _loc7_ = this.buffItemContainer.getChildAt(0) as ItemFace;
            this.buffItemContainer.removeChildAt(0);
            CDFaceManager.removeItemFace(_loc7_);
            _loc7_.destroy();
         }
         while(this.buffBgContainer.numChildren > 0)
         {
            this.buffBgContainer.removeChildAt(0);
         }
         _loc5_ = Math.ceil(_loc3_.length / 5);
         if(_loc5_ == 0)
         {
            _loc5_ = 1;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc8_ = 0;
            while(_loc8_ < 5)
            {
               _loc9_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.buffBgContainer.addChild(_loc9_);
               _loc9_.x = _loc8_ * 40 + 5;
               _loc9_.y = _loc4_ * 40 + this.buffTitle1.y + 20;
               _loc8_++;
            }
            _loc4_++;
         }
         this.buffTitle2.y = _loc9_.y + 45;
         _loc8_ = 0;
         _loc5_ = int(_loc3_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc3_[_loc4_] as Buff;
            _loc7_ = new ItemFace(_loc6_);
            this.buffItemContainer.addChild(_loc7_);
            _loc7_.y = Math.floor(_loc8_ / 5) * 40 + this.buffTitle1.y + 22;
            _loc7_.x = _loc8_++ % 5 * 40 + 7;
            CDFaceManager.registerItemFace(_loc7_);
            _loc4_++;
         }
         this.buffBgContainer1.y = this.buffTitle2.y + 25;
         this.buffItemContainer1.y = this.buffTitle2.y + 27;
         _loc4_ = 0;
         while(_loc4_ < 5)
         {
            _loc9_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.buffBgContainer1.addChild(_loc9_);
            _loc9_.x = _loc4_ * 40 + 5;
            _loc4_++;
         }
         _loc5_ = int(param2.length);
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = param2[_loc4_] as Buff;
            _loc7_ = new ItemFace(_loc6_);
            this.buffItemContainer1.addChild(_loc7_);
            _loc7_.x = _loc4_ * 40 + 7;
            _loc7_.filters = Tools.blackWhiteFilter;
            _loc4_++;
         }
         this.buffContainer.height = this.buffTitle2.y + 75;
      }
      
      public function showJing(param1:int) : void
      {
         var _loc2_:String = null;
         this.jingTime = param1;
         this.jingBtn.visible = true;
         this.jingtTimer.reset();
         this.jingtTimer.repeatCount = this.jingTime;
         this.jingtTimer.start();
         _loc2_ = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,"本队伍参与跨服擂台的竞技中您是参战人员请注意若您退出队伍将会清除整支队伍的参战报名",[StaticValue.PURPLE50_HTML,StaticValue.RED_HTML,this.jingTime,StaticValue.YELLOW_HTML,StaticValue.GREEN_HTML,StaticValue.SKY_BLUE_HTML]) + "</textformat>";
         this.jingBtn.toolTip = _loc2_;
      }
      
      public function hideJing() : void
      {
         this.jingtTimer.stop();
         this.jingBtn.visible = false;
      }
      
      private function jingTimeFun(param1:TimerEvent) : void
      {
         var _loc2_:String = null;
         --this.jingTime;
         _loc2_ = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,"本队伍参与跨服擂台的竞技中您是参战人员请注意若您退出队伍将会清除整支队伍的参战报名",[StaticValue.PURPLE50_HTML,StaticValue.RED_HTML,this.jingTime,StaticValue.YELLOW_HTML,StaticValue.GREEN_HTML,StaticValue.SKY_BLUE_HTML]) + "</textformat>";
         this.jingBtn.toolTip = _loc2_;
      }
      
      public function showZhan(param1:String) : void
      {
         this.zhanBtn.visible = true;
         this.zhanBtn.toolTip = LanResManager.getLanTextWords(this,"您已经报名参加了跨服襄阳战场正在等待系统匹配战场本轮战场报名",[StaticValue.WHITE_HTML,param1]) + "</textformat>";
      }
      
      public function hideZhan() : void
      {
         this.zhanBtn.visible = false;
      }
      
      public function zhengfuYincang(param1:Boolean) : void
      {
         if(param1)
         {
            this.zhengfuBtn.mouseEnabled = true;
            this.buffBtn.mouseEnabled = true;
            this.huodongBtn.mouseEnabled = true;
            this.infoBtn.mouseEnabled = true;
            this.showHidePlayerBtn.mouseEnabled = true;
            this.openCloseSoundBtn.mouseEnabled = true;
            this.hideBtn.mouseEnabled = true;
            this.jingBtn.mouseEnabled = true;
            this.zhanBtn.mouseEnabled = true;
            this.mapBtn.mouseEnabled = true;
            this.topBtn.mouseEnabled = true;
            this.lineBtn.mouseEnabled = true;
         }
         else
         {
            this.zhengfuBtn.mouseEnabled = false;
            this.buffBtn.mouseEnabled = false;
            this.huodongBtn.mouseEnabled = false;
            this.infoBtn.mouseEnabled = false;
            this.showHidePlayerBtn.mouseEnabled = false;
            this.openCloseSoundBtn.mouseEnabled = false;
            this.hideBtn.mouseEnabled = false;
            this.jingBtn.mouseEnabled = false;
            this.zhanBtn.mouseEnabled = false;
            this.mapBtn.mouseEnabled = false;
            this.topBtn.mouseEnabled = false;
            this.lineBtn.mouseEnabled = false;
         }
      }
   }
}

