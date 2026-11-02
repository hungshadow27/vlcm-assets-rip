package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FButton;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.moudels.aojianshenjiangji.model.info.AoJianShenJiangJiVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class AoJianShenJiangJi extends Sprite
   {
      
      private var _$parent:DisplayObject;
      
      private var kuang:Bitmap;
      
      private var tabBar:FTabBar;
      
      private var tabSpr:Sprite;
      
      private var bg:DisplayObject;
      
      private var renwu:DisplayObject;
      
      private var renwu1:DisplayObject;
      
      private var renwu2:DisplayObject;
      
      private var renwu3:DisplayObject;
      
      private var xilieBit1:DisplayObject;
      
      private var xilieBit2:DisplayObject;
      
      private var xilieBit3:DisplayObject;
      
      private var help:DisplayObject;
      
      private var xilieSpr:Sprite;
      
      private var helpBtn:FSimpleButton;
      
      private var shenjiangArr:Array;
      
      private var equipContainers1:Sprite;
      
      private var equipContainers2:Sprite;
      
      private var equipContainers3:Sprite;
      
      private var equipContainers4:Sprite;
      
      private var equipContainers5:Sprite;
      
      private var equipContainers6:Sprite;
      
      private var equipContainers7:Sprite;
      
      private var equipContainers8:Sprite;
      
      private var equipContainers9:Sprite;
      
      private var equipContainers10:Sprite;
      
      private var zhuangbeiAr1:Array;
      
      private var zhuangbeiAr2:Array;
      
      private var zhuangbeiAr3:Array;
      
      private var zhuangbeiAr4:Array;
      
      private var zhuangbeiAr5:Array;
      
      private var zhuangbeiAr6:Array;
      
      private var zhuangbeiAr7:Array;
      
      private var zhuangbeiAr8:Array;
      
      private var zhuangbeiAr9:Array;
      
      private var zhuangbeiAr10:Array;
      
      private var xuanzeSpr:Sprite;
      
      private var zhuangbeiWeizhi:int = 0;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var shuxing1:String;
      
      private var shuxing2:String;
      
      private var shuxing3:String;
      
      private var yongyou1:int;
      
      private var yongyou2:int;
      
      private var yongyou3:int;
      
      private var fts1:FTextArea;
      
      private var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var shenjiangByte:int = 0;
      
      private var renwuSpr:Sprite;
      
      private var shuzuByte:int = 0;
      
      private var isMain:Boolean;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var fts2:FTextArea;
      
      private var check2:FCheckBox;
      
      private var checkLabel2:FLabel;
      
      private var fts3:FTextArea;
      
      private var check3:FCheckBox;
      
      private var checkLabel3:FLabel;
      
      private var fts4:FTextArea;
      
      private var check4:FCheckBox;
      
      private var checkLabel4:FLabel;
      
      public function AoJianShenJiangJi()
      {
         this.shenjiangArr = [];
         this.zhuangbeiAr1 = [];
         this.zhuangbeiAr2 = [];
         this.zhuangbeiAr3 = [];
         this.zhuangbeiAr4 = [];
         this.zhuangbeiAr5 = [];
         this.zhuangbeiAr6 = [];
         this.zhuangbeiAr7 = [];
         this.zhuangbeiAr8 = [];
         this.zhuangbeiAr9 = [];
         this.zhuangbeiAr10 = [];
         super();
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/aojianshenjiangji/bg.swf");
         this.bg.visible = true;
         this.bg.x = -1;
         this.bg.y = 1;
         addChild(this.bg);
         this.renwu = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/aojianshenjiangji/renwu1.swf");
         this.renwu.visible = true;
         this.renwu.x = -1;
         this.renwu.y = 1;
         this.tabSpr = new Sprite();
         addChild(this.tabSpr);
         this.renwuSpr = new Sprite();
         addChild(this.renwuSpr);
         this.xilieSpr = new Sprite();
         addChild(this.xilieSpr);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.wordWrap = true;
         this.tip.width = 250;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.help = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/aojianshenjiangji/help.swf");
         this.help.visible = true;
         this.help.x = 350;
         this.help.y = 330;
         addChild(this.help);
         ToolTips.createToolTips(this.help,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("1、激活傲剑神将，即可佩戴相应神将特技。") + "<br>" + LanResManager.getLanCommonTextWords("2、神将特技自身具有强大属性，凑齐整套神将特技，会有相应的套装属性加成。") + "<br>" + LanResManager.getLanCommonTextWords("3、玩家可同时佩戴多套神将特技。") + "<br>" + LanResManager.getLanCommonTextWords("4、神将技共3套，分别为破军系列、钟釜系列和云逸系列；每个系列都有自己独特的套装属性。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.equipContainers1 = new Sprite();
         this.equipContainers1.name = "1";
         this.equipContainers1.x = 21;
         this.equipContainers1.y = 96;
         with(this.equipContainers1)
         {
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,35,35);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         this.equipContainers1.addEventListener(MouseEvent.CLICK,this.onItemClick);
         addChild(this.equipContainers1);
         this.equipContainers2 = new Sprite();
         this.equipContainers2.name = "2";
         this.equipContainers2.x = 21;
         this.equipContainers2.y = 96 + 48;
         with(this.equipContainers2)
         {
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,35,35);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         this.equipContainers2.addEventListener(MouseEvent.CLICK,this.onItemClick);
         addChild(this.equipContainers2);
         this.equipContainers3 = new Sprite();
         this.equipContainers3.name = "3";
         this.equipContainers3.x = 21;
         this.equipContainers3.y = 96 + 48 + 48;
         with(this.equipContainers3)
         {
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,35,35);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         this.equipContainers3.addEventListener(MouseEvent.CLICK,this.onItemClick);
         addChild(this.equipContainers3);
         this.equipContainers4 = new Sprite();
         this.equipContainers4.name = "4";
         this.equipContainers4.x = 21;
         this.equipContainers4.y = 96 + 48 + 48 + 48;
         with(this.equipContainers4)
         {
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,35,35);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         this.equipContainers4.addEventListener(MouseEvent.CLICK,this.onItemClick);
         addChild(this.equipContainers4);
         this.equipContainers5 = new Sprite();
         this.equipContainers5.name = "5";
         this.equipContainers5.x = 21;
         this.equipContainers5.y = 96 + 48 + 48 + 48 + 48;
         with(this.equipContainers5)
         {
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,35,35);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         this.equipContainers5.addEventListener(MouseEvent.CLICK,this.onItemClick);
         addChild(this.equipContainers5);
         this.equipContainers6 = new Sprite();
         this.equipContainers6.name = "6";
         this.equipContainers6.x = 344;
         this.equipContainers6.y = 96;
         with(this.equipContainers6)
         {
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,35,35);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         this.equipContainers6.addEventListener(MouseEvent.CLICK,this.onItemClick);
         addChild(this.equipContainers6);
         this.equipContainers7 = new Sprite();
         this.equipContainers7.name = "7";
         this.equipContainers7.x = 344;
         this.equipContainers7.y = 96 + 48;
         with(this.equipContainers7)
         {
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,35,35);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         this.equipContainers7.addEventListener(MouseEvent.CLICK,this.onItemClick);
         addChild(this.equipContainers7);
         this.equipContainers8 = new Sprite();
         this.equipContainers8.name = "8";
         this.equipContainers8.x = 344;
         this.equipContainers8.y = 96 + 48 + 48;
         with(this.equipContainers8)
         {
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,35,35);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         this.equipContainers8.addEventListener(MouseEvent.CLICK,this.onItemClick);
         addChild(this.equipContainers8);
         this.equipContainers9 = new Sprite();
         this.equipContainers9.name = "9";
         this.equipContainers9.x = 344;
         this.equipContainers9.y = 96 + 48 + 48 + 48;
         with(this.equipContainers9)
         {
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,35,35);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         this.equipContainers9.addEventListener(MouseEvent.CLICK,this.onItemClick);
         addChild(this.equipContainers9);
         this.equipContainers10 = new Sprite();
         this.equipContainers10.name = "10";
         this.equipContainers10.x = 344;
         this.equipContainers10.y = 96 + 48 + 48 + 48 + 48;
         with(this.equipContainers10)
         {
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,35,35);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         this.equipContainers10.addEventListener(MouseEvent.CLICK,this.onItemClick);
         addChild(this.equipContainers10);
         this.xuanzeSpr = new Sprite();
         this.xuanzeSpr.x = 55;
         this.xuanzeSpr.y = 95;
         this.xuanzeSpr.addEventListener(MouseEvent.CLICK,this.onItemClick2,false,30);
         addChild(this.xuanzeSpr);
         this.fts1 = new FTextArea();
         this.fts1.x = 275;
         this.fts1.y = 42;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("神将金身(已激活)");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：88888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("神将修仙：人物可开启神将功能，后修仙成仙界神将，霸气的外观，金光四射。") + "<br>" + LanResManager.getLanCommonTextWords("神将金身：激活神将金身的玩家，被攻击时100%触发神将金身，持续15秒；在此状态下，自身") + "<br>" + LanResManager.getLanCommonTextWords("将经过三次轮回，每次轮回持续5秒。第一轮回自身将进入金身模式，将不受任何伤害的影响；") + "<br>" + LanResManager.getLanCommonTextWords("第二轮回自身将进入法渡模式，无限清除自身所有负面BUFF；第三轮回自身将转化成仙，5格") + "<br>" + LanResManager.getLanCommonTextWords("内的所有玩家都将产生时间停止，停顿住。冷却90秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.visible = false;
         this.check.x = 275;
         this.check.y = 28 + 35;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel = new FLabel();
         this.checkLabel.visible = false;
         with(this.checkLabel)
         {
            x = check.x + 20;
            --check.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343;
         this.equipContainers.y = 12 + 30;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         addChild(this.equipContainers);
         this.fts2 = new FTextArea();
         this.fts2.x = 275;
         this.fts2.y = 42 + 40;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("赵敏(已激活)");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("同时拥有张无忌破军、钟釜、云逸套的玩家可双击使用，自古英雄配美人，") + "<br>" + LanResManager.getLanCommonTextWords("张无忌神将面板将开启赵敏切换功能，人物可随意切换赵敏换装。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.visible = false;
         this.check2.x = 275;
         this.check2.y = 28 + 35 + 40;
         this.check2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel2 = new FLabel();
         this.checkLabel2.visible = false;
         with(this.checkLabel2)
         {
            x = check2.x + 20;
            --check2.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel2);
         this.fts3 = new FTextArea();
         this.fts3.x = 275;
         this.fts3.y = 42;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("屠龙刀(已激活)");
         this.fts3.visible = false;
         addChild(this.fts3);
         this.check3 = new FCheckBox();
         addChild(this.check3);
         this.check3.visible = false;
         this.check3.x = 275;
         this.check3.y = 28 + 35;
         this.check3.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel3 = new FLabel();
         this.checkLabel3.visible = false;
         with(this.checkLabel3)
         {
            x = check3.x + 20;
            --check3.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel3);
         this.fts4 = new FTextArea();
         this.fts4.x = 275;
         this.fts4.y = 42;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = "齐天大圣(已激活)";
         this.fts4.visible = false;
         addChild(this.fts4);
         this.check4 = new FCheckBox();
         addChild(this.check4);
         this.check4.visible = false;
         this.check4.x = 275;
         this.check4.y = 28 + 35;
         this.check4.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel4 = new FLabel();
         this.checkLabel4.visible = false;
         with(this.checkLabel4)
         {
            x = check4.x + 20;
            --check4.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel4);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.check:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,17]));
               break;
            case this.check2:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check2.selectState,33]));
               break;
            case this.check3:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check3.selectState,32]));
               break;
            case this.check4:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check4.selectState,SpecialGoodsID.AOJIANSJJ_QITIANDASHENG]));
         }
      }
      
      private function onCheckTip(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.xilieBit1.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               this.xilieBit2.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               this.xilieBit3.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = int(param1.target.name);
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.xilieBit1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               this.xilieBit2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               this.xilieBit3.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
         }
      }
      
      private function showTip(param1:int) : void
      {
         if(param1 == 1)
         {
            this.tip.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("破军套装【") + this.yongyou1 + "/10】" + "<br>" + LanResManager.getLanCommonTextWords("激活条件：集齐十件破军神将部件可激活破军套装效果。") + "<br>" + LanResManager.getLanCommonTextWords("装备属性：攻击+1000000，防守 +1000000，武功加层 +10") + "<br>" + LanResManager.getLanCommonTextWords("套装效果：") + this.shuxing1 + "</font>";
         }
         else if(param1 == 2)
         {
            this.tip.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("钟釜套装【") + this.yongyou2 + "/10】" + "<br>" + LanResManager.getLanCommonTextWords("激活条件：集齐十件钟釜神将部件可激活钟釜套装效果和华丽的特效。") + "<br>" + LanResManager.getLanCommonTextWords("装备属性：攻击+2000000，防守 +2000000，武功加层 +20") + "<br>" + LanResManager.getLanCommonTextWords("套装效果：") + this.shuxing2 + "</font>";
         }
         else if(param1 == 3)
         {
            this.tip.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("云逸套装【") + this.yongyou3 + "/10】" + "<br>" + LanResManager.getLanCommonTextWords("激活条件：集齐十件云逸套装的玩家可激活云逸套装传奇技能和云逸套装特效。") + "<br>" + LanResManager.getLanCommonTextWords("装备属性：攻击+4000000，防守 +4000000，武功加层 +40") + "<br>" + LanResManager.getLanCommonTextWords("套装效果：") + this.shuxing3 + "</font>";
         }
         else if(param1 == 4)
         {
            this.tip.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("舞龙套装") + "【" + this.yongyou1 + "/10】" + "<br>" + LanResManager.getLanCommonTextWords("舞龙套装激活条件：收集满10套装备") + "<br>" + LanResManager.getLanCommonTextWords("舞龙装备属性：攻击+1000000，防守 +1000000，武功加层 +10") + "<br>" + LanResManager.getLanCommonTextWords("套装效果：") + this.shuxing1 + "</font>";
         }
         else if(param1 == 5)
         {
            this.tip.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("云龙套装") + "【" + this.yongyou2 + "/10】" + "<br>" + LanResManager.getLanCommonTextWords("云龙套装激活条件：收集满10套装备") + "<br>" + LanResManager.getLanCommonTextWords("云龙装备属性：攻击+2000000，防守 +2000000，武功加层 +20") + "<br>" + LanResManager.getLanCommonTextWords("套装效果：") + this.shuxing2 + "</font>";
         }
         else if(param1 == 6)
         {
            this.tip.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("天龙套装") + "【" + this.yongyou3 + "/10】" + "<br>" + LanResManager.getLanCommonTextWords("天龙套装激活条件：收集满10套装备") + "<br>" + LanResManager.getLanCommonTextWords("天龙套装装备属性：攻击+4000000，防守 +4000000，武功加层 +40") + "<br>" + LanResManager.getLanCommonTextWords("套装效果：") + this.shuxing3 + "</font>";
         }
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 5;
         this.tipCanvas.y = mouseY + 5;
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.shenjiangArr != null)
         {
            _loc2_ = 0;
            while(_loc2_ < this.shenjiangArr.length)
            {
               if((param1.target as FButton).label == this.shenjiangArr[_loc2_].name)
               {
                  if(this.isMain)
                  {
                     this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_AOJIANSHENJIANGJI_QIEHUAN_CLICK,"",this.shenjiangArr[_loc2_].byte));
                  }
                  else
                  {
                     this._$parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_AOJIANSHENJIANGJI_QIEHUAN_CLICK,"",this.shenjiangArr[_loc2_].byte));
                  }
               }
               _loc2_++;
            }
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "1":
               this.zhuangbeiWeizhi = 1;
               break;
            case "2":
               this.zhuangbeiWeizhi = 2;
               break;
            case "3":
               this.zhuangbeiWeizhi = 3;
               break;
            case "4":
               this.zhuangbeiWeizhi = 4;
               break;
            case "5":
               this.zhuangbeiWeizhi = 5;
               break;
            case "6":
               this.zhuangbeiWeizhi = 6;
               break;
            case "7":
               this.zhuangbeiWeizhi = 7;
               break;
            case "8":
               this.zhuangbeiWeizhi = 8;
               break;
            case "9":
               this.zhuangbeiWeizhi = 9;
               break;
            case "10":
               this.zhuangbeiWeizhi = 10;
         }
         this.xuanzheXunzhang(this.zhuangbeiWeizhi);
      }
      
      private function onItemClick2(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.xuanzeSpr.mouseX > 0 && this.xuanzeSpr.mouseX < 36)
         {
            _loc2_ = 0;
         }
         else if(this.xuanzeSpr.mouseX > 36 && this.xuanzeSpr.mouseX < 72)
         {
            _loc2_ = 1;
         }
         else if(this.xuanzeSpr.mouseX > 72 && this.xuanzeSpr.mouseX < 108)
         {
            _loc2_ = 2;
         }
         this.xuanzhong(_loc2_);
         while(this.xuanzeSpr.numChildren > 0)
         {
            this.xuanzeSpr.removeChildAt(0);
         }
      }
      
      private function xuanzhong(param1:int) : void
      {
         while(this["equipContainers" + this.zhuangbeiWeizhi].numChildren > 0)
         {
            this["equipContainers" + this.zhuangbeiWeizhi].removeChildAt(0);
         }
         var _loc2_:Goods = this["zhuangbeiAr" + this.zhuangbeiWeizhi][param1] as Goods;
         var _loc3_:ItemFace = new ItemFace(_loc2_);
         _loc3_.name = String(this.zhuangbeiWeizhi);
         this["equipContainers" + this.zhuangbeiWeizhi].addChild(_loc3_);
      }
      
      private function xuanzheXunzhang(param1:int) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.xuanzeSpr.numChildren > 0)
         {
            this.xuanzeSpr.removeChildAt(0);
         }
         switch(param1)
         {
            case 1:
               this.xuanzeSpr.x = 65;
               this.xuanzeSpr.y = 96;
               break;
            case 2:
               this.xuanzeSpr.x = 65;
               this.xuanzeSpr.y = 96 + 48;
               break;
            case 3:
               this.xuanzeSpr.x = 65;
               this.xuanzeSpr.y = 96 + 48 + 48;
               break;
            case 4:
               this.xuanzeSpr.x = 65;
               this.xuanzeSpr.y = 96 + 48 + 48 + 48;
               break;
            case 5:
               this.xuanzeSpr.x = 65;
               this.xuanzeSpr.y = 96 + 48 + 48 + 48 + 48;
               break;
            case 6:
               this.xuanzeSpr.x = 220;
               this.xuanzeSpr.y = 96;
               break;
            case 7:
               this.xuanzeSpr.x = 220;
               this.xuanzeSpr.y = 96 + 48;
               break;
            case 8:
               this.xuanzeSpr.x = 220;
               this.xuanzeSpr.y = 96 + 48 + 48;
               break;
            case 9:
               this.xuanzeSpr.x = 220;
               this.xuanzeSpr.y = 96 + 48 + 48 + 48;
               break;
            case 10:
               this.xuanzeSpr.x = 220;
               this.xuanzeSpr.y = 96 + 48 + 48 + 48 + 48;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this["zhuangbeiAr" + param1].length)
         {
            _loc3_ = this["zhuangbeiAr" + param1][_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            _loc4_.x = 40 * _loc2_;
            this.xuanzeSpr.addChild(_loc4_);
            _loc2_++;
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:AoJianShenJiangJiVO) : void
      {
         var _loc5_:int = 0;
         this.isMain = param1;
         this.shenjiangByte = param2.shenjiangByte;
         this.equipContainers.visible = false;
         while(this.renwuSpr.numChildren > 0)
         {
            this.renwuSpr.removeChildAt(0);
         }
         this.renwu1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/aojianshenjiangji/renwu" + (this.shenjiangByte + 1) + "_1.swf");
         this.renwu2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/aojianshenjiangji/renwu" + (this.shenjiangByte + 1) + "_2.swf");
         this.renwu3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/aojianshenjiangji/renwu" + (this.shenjiangByte + 1) + "_3.swf");
         this.renwu1.visible = true;
         this.renwu1.x = -1;
         this.renwu1.y = 1;
         this.renwuSpr.addChild(this.renwu1);
         this.renwu2.visible = true;
         this.renwu2.x = -1;
         this.renwu2.y = 1;
         this.renwuSpr.addChild(this.renwu2);
         this.renwu3.visible = false;
         this.renwu3.x = -1;
         this.renwu3.y = 1;
         this.renwuSpr.addChild(this.renwu3);
         this.check.selectState = param2.huanzhuang;
         this.check2.selectState = param2.isZhaoMin;
         this.check3.selectState = param2.isTuLongDao;
         this.setJihuo(param1);
         while(this.xuanzeSpr.numChildren > 0)
         {
            this.xuanzeSpr.removeChildAt(0);
         }
         this.shenjiangArr = param2.shenjiangArr;
         this.yongyou1 = param2.taozhuangCount1;
         this.yongyou2 = param2.taozhuangCount2;
         this.yongyou3 = param2.taozhuangCount3;
         this.shuxing1 = param2.taozhuangFt1;
         this.shuxing2 = param2.taozhuangFt2;
         this.shuxing3 = param2.taozhuangFt3;
         while(this.tabSpr.numChildren > 0)
         {
            this.tabSpr.removeChildAt(0);
         }
         if(Boolean(this.tabBar) && Boolean(this.tabBar.parent))
         {
            this.tabBar.parent.removeChild(this.tabBar);
            this.tabBar = null;
         }
         this.tabBar = new FTabBar();
         addChild(this.tabBar);
         this.tabBar.x = 3;
         this.tabBar.y = 6;
         var _loc3_:int = 0;
         while(_loc3_ < this.shenjiangArr.length)
         {
            this.tabBar.addButton(this.shenjiangArr[_loc3_].name,this.onTabClick);
            if(this.shenjiangArr[_loc3_].byte == param2.shenjiangByte)
            {
               this.shuzuByte = _loc3_;
            }
            _loc3_++;
         }
         var _loc4_:String = this.shenjiangArr[this.shuzuByte].name;
         this.tabBar.setCurrentButtonByLabel(_loc4_);
         while(this.xilieSpr.numChildren > 0)
         {
            this.xilieSpr.removeChildAt(0);
         }
         if(param2.shenjiangByte == 0)
         {
            this.xilieBit1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/aojianshenjiangji/pojunL.swf");
            this.xilieBit1.name = "1";
            this.xilieBit2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/aojianshenjiangji/zhongfuL.swf");
            this.xilieBit2.name = "2";
            this.xilieBit3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/aojianshenjiangji/yunyiL.swf");
            this.xilieBit3.name = "3";
         }
         else if(param2.shenjiangByte == 1)
         {
            _loc5_ = -1;
            if(param2.shenjiangArr.length > 1)
            {
               _loc5_ = 1;
            }
            else
            {
               _loc5_ = 0;
            }
            if(param2.shenjiangByte == int(param2.shenjiangArr[_loc5_].byte))
            {
               this.xilieBit1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/aojianshenjiangji/wulongL.swf");
               this.xilieBit1.name = "4";
               this.xilieBit2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/aojianshenjiangji/yunlongL.swf");
               this.xilieBit2.name = "5";
               this.xilieBit3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/aojianshenjiangji/tianlongL.swf");
               this.xilieBit3.name = "6";
            }
         }
         this.xilieBit1.visible = true;
         this.xilieBit1.x = 10;
         this.xilieBit1.y = 40;
         this.xilieSpr.addChild(this.xilieBit1);
         this.xilieBit1.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.xilieBit1.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
         this.xilieBit2.visible = true;
         this.xilieBit2.x = 10 + 35;
         this.xilieBit2.y = 40;
         this.xilieSpr.addChild(this.xilieBit2);
         this.xilieBit2.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.xilieBit2.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
         this.xilieBit3.visible = true;
         this.xilieBit3.x = 10 + 70;
         this.xilieBit3.y = 40;
         this.xilieSpr.addChild(this.xilieBit3);
         this.xilieBit3.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.xilieBit3.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
         if(param2.taozhuangCount1 != 10)
         {
            this.xilieBit1.filters = Tools.blackWhiteFilter;
            this.renwu1.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.xilieBit1.filters = [];
            this.renwu1.filters = [];
         }
         if(param2.taozhuangCount2 != 10)
         {
            this.xilieBit2.filters = Tools.blackWhiteFilter;
            this.renwu2.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.xilieBit2.filters = [];
            this.renwu2.filters = [];
         }
         if(param2.taozhuangCount3 != 10)
         {
            this.xilieBit3.filters = Tools.blackWhiteFilter;
            this.renwu3.visible = false;
         }
         else
         {
            this.xilieBit3.filters = [];
            this.renwu3.visible = true;
         }
      }
      
      public function setJihuo(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.shenjiangByte == 0)
            {
               if(GameState.dictMainStatus[SpecialGoodsID.AOJIANSHENJIANGJI_SHENJIANGJINSHEN_ID])
               {
                  this.fts1.visible = true;
                  this.check.visible = true;
                  this.checkLabel.visible = true;
               }
               else
               {
                  this.fts1.visible = false;
                  this.check.visible = false;
                  this.checkLabel.visible = false;
               }
            }
            else
            {
               this.fts1.visible = false;
               this.check.visible = false;
               this.checkLabel.visible = false;
            }
            if(this.shenjiangByte == 1)
            {
               if(GameState.dictMainStatus[SpecialGoodsID.AOJIANSHENJIANGJI_ZHAOMIN_ID])
               {
                  this.fts2.visible = true;
                  this.check2.visible = true;
                  this.checkLabel2.visible = true;
               }
               else
               {
                  this.fts2.visible = false;
                  this.check2.visible = false;
                  this.checkLabel2.visible = false;
               }
            }
            else
            {
               this.fts2.visible = false;
               this.check2.visible = false;
               this.checkLabel2.visible = false;
            }
            if(this.shenjiangByte == 2)
            {
               if(GameState.dictMainStatus[SpecialGoodsID.AOJIANSJJ_QITIANDASHENG])
               {
                  this.fts4.visible = true;
                  this.check4.visible = true;
                  this.checkLabel4.visible = true;
               }
               else
               {
                  this.fts4.visible = false;
                  this.check4.visible = false;
                  this.checkLabel4.visible = false;
               }
            }
            else
            {
               this.fts4.visible = false;
               this.check4.visible = false;
               this.checkLabel4.visible = false;
            }
         }
         else
         {
            if(this.shenjiangByte == 0)
            {
               if(GameState.dictTargetStatus[SpecialGoodsID.AOJIANSHENJIANGJI_SHENJIANGJINSHEN_ID])
               {
                  this.fts1.visible = true;
                  this.check.visible = true;
                  this.checkLabel.visible = true;
               }
               else
               {
                  this.fts1.visible = false;
                  this.check.visible = false;
                  this.checkLabel.visible = false;
               }
            }
            else
            {
               this.fts1.visible = false;
               this.check.visible = false;
               this.checkLabel.visible = false;
            }
            if(this.shenjiangByte == 1)
            {
               if(GameState.dictTargetStatus[SpecialGoodsID.AOJIANSHENJIANGJI_ZHAOMIN_ID])
               {
                  this.fts2.visible = true;
                  this.check2.visible = true;
                  this.checkLabel2.visible = true;
               }
               else
               {
                  this.fts2.visible = false;
                  this.check2.visible = false;
                  this.checkLabel2.visible = false;
               }
            }
            else
            {
               this.fts2.visible = false;
               this.check2.visible = false;
               this.checkLabel2.visible = false;
            }
            if(this.shenjiangByte == 2)
            {
               if(GameState.dictTargetStatus[SpecialGoodsID.AOJIANSJJ_QITIANDASHENG])
               {
                  this.fts4.visible = true;
                  this.check4.visible = true;
                  this.checkLabel4.visible = true;
               }
               else
               {
                  this.fts4.visible = false;
                  this.check4.visible = false;
                  this.checkLabel4.visible = false;
               }
            }
            else
            {
               this.fts4.visible = false;
               this.check4.visible = false;
               this.checkLabel4.visible = false;
            }
         }
      }
      
      public function setEnableFun() : void
      {
         this.equipContainers1.removeEventListener(MouseEvent.CLICK,this.onItemClick);
         this.equipContainers2.removeEventListener(MouseEvent.CLICK,this.onItemClick);
         this.equipContainers3.removeEventListener(MouseEvent.CLICK,this.onItemClick);
         this.equipContainers4.removeEventListener(MouseEvent.CLICK,this.onItemClick);
         this.equipContainers5.removeEventListener(MouseEvent.CLICK,this.onItemClick);
         this.equipContainers6.removeEventListener(MouseEvent.CLICK,this.onItemClick);
         this.equipContainers7.removeEventListener(MouseEvent.CLICK,this.onItemClick);
         this.equipContainers8.removeEventListener(MouseEvent.CLICK,this.onItemClick);
         this.equipContainers9.removeEventListener(MouseEvent.CLICK,this.onItemClick);
         this.equipContainers10.removeEventListener(MouseEvent.CLICK,this.onItemClick);
         this.check.enabled = false;
      }
      
      public function set_AoJianShenJiangXunZhang(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         this.zhuangbeiAr1 = [];
         this.zhuangbeiAr2 = [];
         this.zhuangbeiAr3 = [];
         this.zhuangbeiAr4 = [];
         this.zhuangbeiAr5 = [];
         this.zhuangbeiAr6 = [];
         this.zhuangbeiAr7 = [];
         this.zhuangbeiAr8 = [];
         this.zhuangbeiAr9 = [];
         this.zhuangbeiAr10 = [];
         while(this.equipContainers1.numChildren > 0)
         {
            this.equipContainers1.removeChildAt(0);
         }
         while(this.equipContainers2.numChildren > 0)
         {
            this.equipContainers2.removeChildAt(0);
         }
         while(this.equipContainers3.numChildren > 0)
         {
            this.equipContainers3.removeChildAt(0);
         }
         while(this.equipContainers4.numChildren > 0)
         {
            this.equipContainers4.removeChildAt(0);
         }
         while(this.equipContainers5.numChildren > 0)
         {
            this.equipContainers5.removeChildAt(0);
         }
         while(this.equipContainers6.numChildren > 0)
         {
            this.equipContainers6.removeChildAt(0);
         }
         while(this.equipContainers7.numChildren > 0)
         {
            this.equipContainers7.removeChildAt(0);
         }
         while(this.equipContainers8.numChildren > 0)
         {
            this.equipContainers8.removeChildAt(0);
         }
         while(this.equipContainers9.numChildren > 0)
         {
            this.equipContainers9.removeChildAt(0);
         }
         while(this.equipContainers10.numChildren > 0)
         {
            this.equipContainers10.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == 11001 + this.shenjiangByte * 30 || _loc3_.res.position == 11011 + this.shenjiangByte * 30 || _loc3_.res.position == 11021 + this.shenjiangByte * 30)
            {
               _loc4_.name = "1";
               this.equipContainers1.addChild(_loc4_);
               this.zhuangbeiAr1.push(_loc3_);
            }
            else if(_loc3_.res.position == 11002 + this.shenjiangByte * 30 || _loc3_.res.position == 11012 + this.shenjiangByte * 30 || _loc3_.res.position == 11022 + this.shenjiangByte * 30)
            {
               _loc4_.name = "2";
               this.equipContainers2.addChild(_loc4_);
               this.zhuangbeiAr2.push(_loc3_);
            }
            else if(_loc3_.res.position == 11003 + this.shenjiangByte * 30 || _loc3_.res.position == 11013 + this.shenjiangByte * 30 || _loc3_.res.position == 11023 + this.shenjiangByte * 30)
            {
               _loc4_.name = "3";
               this.equipContainers3.addChild(_loc4_);
               this.zhuangbeiAr3.push(_loc3_);
            }
            else if(_loc3_.res.position == 11004 + this.shenjiangByte * 30 || _loc3_.res.position == 11014 + this.shenjiangByte * 30 || _loc3_.res.position == 11024 + this.shenjiangByte * 30)
            {
               _loc4_.name = "4";
               this.equipContainers4.addChild(_loc4_);
               this.zhuangbeiAr4.push(_loc3_);
            }
            else if(_loc3_.res.position == 11005 + this.shenjiangByte * 30 || _loc3_.res.position == 11015 + this.shenjiangByte * 30 || _loc3_.res.position == 11025 + this.shenjiangByte * 30)
            {
               _loc4_.name = "5";
               this.equipContainers5.addChild(_loc4_);
               this.zhuangbeiAr5.push(_loc3_);
            }
            else if(_loc3_.res.position == 11006 + this.shenjiangByte * 30 || _loc3_.res.position == 11016 + this.shenjiangByte * 30 || _loc3_.res.position == 11026 + this.shenjiangByte * 30)
            {
               _loc4_.name = "6";
               this.equipContainers6.addChild(_loc4_);
               this.zhuangbeiAr6.push(_loc3_);
            }
            else if(_loc3_.res.position == 11007 + this.shenjiangByte * 30 || _loc3_.res.position == 11017 + this.shenjiangByte * 30 || _loc3_.res.position == 11027 + this.shenjiangByte * 30)
            {
               _loc4_.name = "7";
               this.equipContainers7.addChild(_loc4_);
               this.zhuangbeiAr7.push(_loc3_);
            }
            else if(_loc3_.res.position == 11008 + this.shenjiangByte * 30 || _loc3_.res.position == 11018 + this.shenjiangByte * 30 || _loc3_.res.position == 11028 + this.shenjiangByte * 30)
            {
               _loc4_.name = "8";
               this.equipContainers8.addChild(_loc4_);
               this.zhuangbeiAr8.push(_loc3_);
            }
            else if(_loc3_.res.position == 11009 + this.shenjiangByte * 30 || _loc3_.res.position == 11019 + this.shenjiangByte * 30 || _loc3_.res.position == 11029 + this.shenjiangByte * 30)
            {
               _loc4_.name = "9";
               this.equipContainers9.addChild(_loc4_);
               this.zhuangbeiAr9.push(_loc3_);
            }
            else if(_loc3_.res.position == 11010 + this.shenjiangByte * 30 || _loc3_.res.position == 11020 + this.shenjiangByte * 30 || _loc3_.res.position == 11030 + this.shenjiangByte * 30)
            {
               _loc4_.name = "10";
               this.equipContainers10.addChild(_loc4_);
               this.zhuangbeiAr10.push(_loc3_);
            }
            _loc2_++;
         }
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(!param1)
         {
            if(this.tabBar != null)
            {
               this.shenjiangArr = [];
            }
         }
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_MingJiaoZhangWuJi(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.equipContainers.addChild(this.kuangHD);
         this.kuangHD.x = 0;
         this.kuangHD.y = 0;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.equipContainers.addChild(this.kuangHD);
         this.kuangHD.x = -270;
         this.kuangHD.y = 270;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.equipContainers.addChild(this.kuangHD);
         this.kuangHD.x = 40 - 270;
         this.kuangHD.y = 270;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_AOJIANSHENJIANGJI_MINGJIAOJIAOZHU)
            {
               _loc4_.x = 2;
               _loc4_.y = 2;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_AOJIANSHENJIANGJI_TULONGDAO)
            {
               _loc4_.x = 2 - 270;
               _loc4_.y = 2 + 270;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.fts3.visible = true;
                  this.check3.visible = true;
               }
               else
               {
                  this.fts3.visible = false;
                  this.check3.visible = false;
               }
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_AOJIANSHENJIANGJI_YITIANJIAN)
            {
               _loc4_.x = 2 - 270 + 40;
               _loc4_.y = 2 + 270;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
         if(this.shenjiangByte != 1)
         {
            this.fts3.visible = false;
            this.check3.visible = false;
         }
      }
   }
}

