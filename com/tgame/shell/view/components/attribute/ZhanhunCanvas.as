package com.tgame.shell.view.components.attribute
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class ZhanhunCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      public var suoBg:Bitmap;
      
      private var btn:SecondButton;
      
      private var sprite:Sprite;
      
      private var fta:FTextArea;
      
      private var zhanhunBtn:SecondButton;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var itemContainer1:Sprite;
      
      private var itemContainer2:Sprite;
      
      private var itemContainer3:Sprite;
      
      private var itemContainer4:Sprite;
      
      private var itemContainer5:Sprite;
      
      private var itemContainer6:Sprite;
      
      private var itemContainer7:Sprite;
      
      private var itemContainer8:Sprite;
      
      private var arr:Array;
      
      private var id:int;
      
      private var classBtn1:NewButton;
      
      private var classBtn2:NewButton;
      
      private var classBtn3:NewButton;
      
      private var classBtn4:NewButton;
      
      private var classBtn5:NewButton;
      
      private var classBtn6:NewButton;
      
      private var classBtn7:NewButton;
      
      private var classBtn8:NewButton;
      
      private var classBtn9:NewButton;
      
      private var classBtn10:NewButton;
      
      private var classBtn11:NewButton;
      
      private var classBtn12:NewButton;
      
      private var p:Point;
      
      private var currItem:ItemFace;
      
      private var bg:Bitmap = null;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var tf:TextFormat;
      
      private var tootips1:String;
      
      private var fts1:FTextArea;
      
      private var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var fts2:FTextArea;
      
      private var suipian:int = 0;
      
      private var fts3:FTextArea;
      
      private var fts4:FTextArea;
      
      private var fts5:FTextArea;
      
      private var molishi:int = 0;
      
      public function ZhanhunCanvas()
      {
         var i:int;
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.zhanhun.bg";
         this.bgImg.x = 0;
         this.bgImg.y = 0;
         addChild(this.bgImg);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tf = new TextFormat();
         this.tf.align = "center";
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
         this.sprite = new Sprite();
         this.sprite.x = 0;
         this.sprite.y = 0;
         addChild(this.sprite);
         this.classBtn1 = new NewButton();
         this.classBtn1.label = LanResManager.getLanCommonTextWords("武器");
         this.classBtn1.width = 35;
         this.classBtn1.height = 35;
         this.classBtn1.setSkin("zhanhunButton");
         this.classBtn1.setPandding(10);
         this.classBtn1.align = "center";
         this.sprite.addChild(this.classBtn1);
         this.classBtn1.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.classBtn1.x = 15;
         this.classBtn1.y = 45;
         this.classBtn2 = new NewButton();
         this.classBtn2.label = LanResManager.getLanCommonTextWords("骑兵");
         this.classBtn2.width = 35;
         this.classBtn2.height = 35;
         this.classBtn2.setSkin("zhanhunButton");
         this.classBtn2.setPandding(10);
         this.classBtn2.align = "center";
         this.sprite.addChild(this.classBtn2);
         this.classBtn2.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.classBtn2.x = 15;
         this.classBtn2.y = 85;
         this.classBtn3 = new NewButton();
         this.classBtn3.label = LanResManager.getLanCommonTextWords("衣服");
         this.classBtn3.width = 35;
         this.classBtn3.height = 35;
         this.classBtn3.setSkin("zhanhunButton");
         this.classBtn3.setPandding(10);
         this.classBtn3.align = "center";
         this.sprite.addChild(this.classBtn3);
         this.classBtn3.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.classBtn3.x = 15;
         this.classBtn3.y = 125;
         this.classBtn4 = new NewButton();
         this.classBtn4.label = LanResManager.getLanCommonTextWords("护手");
         this.classBtn4.width = 35;
         this.classBtn4.height = 35;
         this.classBtn4.setSkin("zhanhunButton");
         this.classBtn4.setPandding(10);
         this.classBtn4.align = "center";
         this.sprite.addChild(this.classBtn4);
         this.classBtn4.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.classBtn4.x = 15;
         this.classBtn4.y = 165;
         this.classBtn5 = new NewButton();
         this.classBtn5.label = LanResManager.getLanCommonTextWords("护腰");
         this.classBtn5.width = 35;
         this.classBtn5.height = 35;
         this.classBtn5.setSkin("zhanhunButton");
         this.classBtn5.setPandding(10);
         this.classBtn5.align = "center";
         this.sprite.addChild(this.classBtn5);
         this.classBtn5.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.classBtn5.x = 15;
         this.classBtn5.y = 205;
         this.classBtn6 = new NewButton();
         this.classBtn6.label = LanResManager.getLanCommonTextWords("靴子");
         this.classBtn6.width = 35;
         this.classBtn6.height = 35;
         this.classBtn6.setSkin("zhanhunButton");
         this.classBtn6.setPandding(10);
         this.classBtn6.align = "center";
         this.sprite.addChild(this.classBtn6);
         this.classBtn6.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.classBtn6.x = 15;
         this.classBtn6.y = 245;
         this.classBtn7 = new NewButton();
         this.classBtn7.label = LanResManager.getLanCommonTextWords("头饰");
         this.classBtn7.width = 35;
         this.classBtn7.height = 35;
         this.classBtn7.setSkin("zhanhunButton");
         this.classBtn7.setPandding(10);
         this.classBtn7.align = "center";
         this.sprite.addChild(this.classBtn7);
         this.classBtn7.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.classBtn7.x = 350;
         this.classBtn7.y = 45;
         this.classBtn8 = new NewButton();
         this.classBtn8.label = LanResManager.getLanCommonTextWords("项链");
         this.classBtn8.width = 35;
         this.classBtn8.height = 35;
         this.classBtn8.setSkin("zhanhunButton");
         this.classBtn8.setPandding(10);
         this.classBtn8.align = "center";
         this.sprite.addChild(this.classBtn8);
         this.classBtn8.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.classBtn8.x = 350;
         this.classBtn8.y = 85;
         this.classBtn9 = new NewButton();
         this.classBtn9.label = LanResManager.getLanCommonTextWords("戒指");
         this.classBtn9.width = 35;
         this.classBtn9.height = 35;
         this.classBtn9.setSkin("zhanhunButton");
         this.classBtn9.setPandding(10);
         this.classBtn9.align = "center";
         this.sprite.addChild(this.classBtn9);
         this.classBtn9.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.classBtn9.x = 350;
         this.classBtn9.y = 125;
         this.classBtn10 = new NewButton();
         this.classBtn10.label = LanResManager.getLanCommonTextWords("手镯");
         this.classBtn10.width = 35;
         this.classBtn10.height = 35;
         this.classBtn10.setSkin("zhanhunButton");
         this.classBtn10.setPandding(10);
         this.classBtn10.align = "center";
         this.sprite.addChild(this.classBtn10);
         this.classBtn10.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.classBtn10.x = 350;
         this.classBtn10.y = 165;
         this.classBtn11 = new NewButton();
         this.classBtn11.label = LanResManager.getLanCommonTextWords("腰坠");
         this.classBtn11.width = 35;
         this.classBtn11.height = 35;
         this.classBtn11.setSkin("zhanhunButton");
         this.classBtn11.setPandding(10);
         this.classBtn11.align = "center";
         this.sprite.addChild(this.classBtn11);
         this.classBtn11.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.classBtn11.x = 350;
         this.classBtn11.y = 205;
         this.classBtn12 = new NewButton();
         this.classBtn12.label = LanResManager.getLanCommonTextWords("披风");
         this.classBtn12.width = 35;
         this.classBtn12.height = 35;
         this.classBtn12.setSkin("zhanhunButton");
         this.classBtn12.setPandding(10);
         this.classBtn12.align = "center";
         this.sprite.addChild(this.classBtn12);
         this.classBtn12.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.classBtn12.x = 350;
         this.classBtn12.y = 245;
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 45;
            y = 19;
            htmlText = "";
         }
         addChild(this.fta);
         this.zhanhunBtn = new SecondButton();
         this.zhanhunBtn.label = LanResManager.getLanCommonTextWords("前往战魂");
         this.zhanhunBtn.x = 330 - 25;
         this.zhanhunBtn.y = 10;
         addChild(this.zhanhunBtn);
         this.zhanhunBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            width = 391;
            height = 53;
            multiline = true;
            wordWrap = true;
            x = 7;
            y = 305;
            htmlText = "";
         }
         addChild(this.fta2);
         i = 1;
         while(i < 9)
         {
            this["itemContainer" + i] = new Sprite();
            this["itemContainer" + i].graphics.beginFill(0,0);
            this["itemContainer" + i].graphics.drawRect(-1,-1,50,50);
            addChild(this["itemContainer" + i]);
            this["itemContainer" + i].addEventListener(MouseEvent.MOUSE_DOWN,this["onMouseDown" + i]);
            this["itemContainer" + i].addEventListener(MouseEvent.MOUSE_UP,this["onItemClick" + i],false,30);
            this["itemContainer" + i].addEventListener(MouseEvent.CLICK,this["onClick" + i]);
            this["itemContainer" + i].addEventListener(MouseEvent.MOUSE_OVER,this["onMouseTip" + i]);
            this["itemContainer" + i].addEventListener(MouseEvent.MOUSE_OUT,this["onMouseTip" + i]);
            i++;
         }
         this.itemContainer1.x = 133;
         this.itemContainer1.y = 23;
         this.itemContainer2.x = 220;
         this.itemContainer2.y = 23;
         this.itemContainer3.x = 282;
         this.itemContainer3.y = 85;
         this.itemContainer4.x = 282;
         this.itemContainer4.y = 172;
         this.itemContainer5.x = 220;
         this.itemContainer5.y = 234;
         this.itemContainer6.x = 133;
         this.itemContainer6.y = 234;
         this.itemContainer7.x = 71;
         this.itemContainer7.y = 172;
         this.itemContainer8.x = 71;
         this.itemContainer8.y = 85;
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 330 + 13;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("英雄守卫");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("英雄守卫：从古至今一直守护着襄阳城的的守卫，人物可自由切换。") + "<br>" + LanResManager.getLanCommonTextWords("英雄之力：攻击时有几率触发英雄守卫，持续10秒；在此状态下，自身将获") + "<br>" + LanResManager.getLanCommonTextWords("得英雄的力量，每将攻击都将有千斤之重，可瞬间击飞对手，每击飞一次对") + "<br>" + LanResManager.getLanCommonTextWords("手，对手都将陷入恐惧当中，无法进行任何攻击，且瞬间掉血60%，持续5秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 100 - 32;
         this.check.y = 330 + 13;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts2 = new FTextArea();
         this.fts2.x = 10 + 150 - 66;
         this.fts2.y = 330 + 13;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("傲剑武力石");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("当前已使用") + suipian + LanResManager.getLanCommonTextWords("可傲剑武力石") + "<br>" + LanResManager.getLanCommonTextWords("增加所有武功") + suipian * 50000 + LanResManager.getLanCommonTextWords("层");
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10 + 150 - 66 + 100;
         this.fts3.y = 330 + 13;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("无影秘籍");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击10888888889000 防御8288888889000 血量10088888889000") + "<br>" + LanResManager.getLanCommonTextWords("暴击108888闪避108888所有武功6000000层") + "<br>" + LanResManager.getLanCommonTextWords("★无影绝学——每次被对手攻击8次都有100%触发无影绝学效果，每次") + "<br>" + LanResManager.getLanCommonTextWords("触发无影效果自身都将进入影身状态，持续3秒；无影绝学技能无冷却。");
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10 + 150 - 66 + 100 + 100;
         this.fts4.y = 330 + 13;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("紫灵神器书");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("紫衣幻阵：同时拥有三大紫灵战神的玩家，双击使用，可激活紫衣幻阵效果，") + "<br>" + LanResManager.getLanCommonTextWords("攻击时有几率触发紫衣幻阵效果，持续10秒；使对手禁锢于幻阵的阵眼中心") + "<br>" + LanResManager.getLanCommonTextWords("无法移动，且在阵眼内，会不断受到阵眼施放的迷雾，影响视线，无法看清") + "<br>" + LanResManager.getLanCommonTextWords("目标，每秒损失40%的血量。当自身进入幻阵迷雾时，100%隐身于阵中，使") + "<br>" + LanResManager.getLanCommonTextWords("对手无法锁定自身，持续5秒。");
            return _loc1_ + "</textformat>";
         });
         this.fts5 = new FTextArea();
         this.fts5.x = 10 + 150 - 66 + 100 + 100;
         this.fts5.y = 330 + 13 - 20 - 60;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 170;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("魔力石");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("魔力石：双击使用可直接提升人物攻击300亿、防御200亿") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + molishi + LanResManager.getLanCommonTextWords("颗魔力石") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + molishi * 300 + LanResManager.getLanCommonTextWords("亿，防御") + molishi * 200 + LanResManager.getLanCommonTextWords("亿");
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,48]));
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.zhanhunBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QUZHANHUN_CLICK));
               break;
            case this.classBtn1:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHUANGBEI_CLICK,"",1));
               break;
            case this.classBtn2:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHUANGBEI_CLICK,"",2));
               break;
            case this.classBtn3:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHUANGBEI_CLICK,"",3));
               break;
            case this.classBtn4:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHUANGBEI_CLICK,"",4));
               break;
            case this.classBtn5:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHUANGBEI_CLICK,"",5));
               break;
            case this.classBtn6:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHUANGBEI_CLICK,"",6));
               break;
            case this.classBtn7:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHUANGBEI_CLICK,"",7));
               break;
            case this.classBtn8:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHUANGBEI_CLICK,"",8));
               break;
            case this.classBtn9:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHUANGBEI_CLICK,"",9));
               break;
            case this.classBtn10:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHUANGBEI_CLICK,"",10));
               break;
            case this.classBtn11:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHUANGBEI_CLICK,"",11));
               break;
            case this.classBtn12:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ZHUANGBEI_CLICK,"",12));
         }
      }
      
      private function onMouseTip1(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.itemContainer1.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.itemContainer1.numChildren > 0)
               {
                  if(this.itemContainer1.getChildAt(0) is Bitmap)
                  {
                     this.tootips1 = LanResManager.getLanCommonTextWords("需要1阶装备才可以开启");
                     this.showTip1(this.tootips1);
                  }
               }
               else
               {
                  this.itemContainer1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.itemContainer1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
         }
      }
      
      private function onMouseTip2(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.itemContainer2.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip2);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.itemContainer2.numChildren > 0)
               {
                  if(this.itemContainer2.getChildAt(0) is Bitmap)
                  {
                     this.tootips1 = LanResManager.getLanCommonTextWords("需要2阶装备才可以开启");
                     this.showTip1(this.tootips1);
                  }
               }
               else
               {
                  this.itemContainer2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip2);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.itemContainer2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip2);
         }
      }
      
      private function onMouseTip3(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.itemContainer3.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.itemContainer3.numChildren > 0)
               {
                  if(this.itemContainer3.getChildAt(0) is Bitmap)
                  {
                     this.tootips1 = LanResManager.getLanCommonTextWords("需要3阶装备才可以开启");
                     this.showTip1(this.tootips1);
                  }
               }
               else
               {
                  this.itemContainer3.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.itemContainer3.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
         }
      }
      
      private function onMouseTip4(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.itemContainer4.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip4);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.itemContainer4.numChildren > 0)
               {
                  if(this.itemContainer4.getChildAt(0) is Bitmap)
                  {
                     this.tootips1 = LanResManager.getLanCommonTextWords("需要4阶装备才可以开启");
                     this.showTip1(this.tootips1);
                  }
               }
               else
               {
                  this.itemContainer4.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip4);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.itemContainer4.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip4);
         }
      }
      
      private function onMouseTip5(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.itemContainer5.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip5);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.itemContainer5.numChildren > 0)
               {
                  if(this.itemContainer5.getChildAt(0) is Bitmap)
                  {
                     this.tootips1 = LanResManager.getLanCommonTextWords("需要5阶装备才可以开启");
                     this.showTip1(this.tootips1);
                  }
               }
               else
               {
                  this.itemContainer5.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip5);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.itemContainer5.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip5);
         }
      }
      
      private function onMouseTip6(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.itemContainer6.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip6);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.itemContainer6.numChildren > 0)
               {
                  if(this.itemContainer6.getChildAt(0) is Bitmap)
                  {
                     this.tootips1 = LanResManager.getLanCommonTextWords("需要6阶装备才可以开启");
                     this.showTip1(this.tootips1);
                  }
               }
               else
               {
                  this.itemContainer6.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip6);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.itemContainer6.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip6);
         }
      }
      
      private function onMouseTip7(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.itemContainer7.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip7);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.itemContainer7.numChildren > 0)
               {
                  if(this.itemContainer7.getChildAt(0) is Bitmap)
                  {
                     this.tootips1 = LanResManager.getLanCommonTextWords("需要7阶装备才可以开启");
                     this.showTip1(this.tootips1);
                  }
               }
               else
               {
                  this.itemContainer7.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip7);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.itemContainer7.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip7);
         }
      }
      
      private function onMouseTip8(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.itemContainer8.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip8);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.itemContainer8.numChildren > 0)
               {
                  if(this.itemContainer8.getChildAt(0) is Bitmap)
                  {
                     this.tootips1 = LanResManager.getLanCommonTextWords("需要8阶装备才可以开启");
                     this.showTip1(this.tootips1);
                  }
               }
               else
               {
                  this.itemContainer8.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip8);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.itemContainer8.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip8);
         }
      }
      
      private function showTip1(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
      
      private function onMouseDown1(param1:MouseEvent) : void
      {
         this.itemContainer1.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove1);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove1(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.itemContainer1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove1);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_START,"",[this.currItem,1]));
            this.itemContainer1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove1);
         }
      }
      
      private function onItemClick1(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_ENTER,"",[1,this["itemContainer" + 1]]));
         this.itemContainer1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove1);
      }
      
      private function onClick1(param1:MouseEvent) : void
      {
         if(param1.target is ItemFace)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_STONE_CLICK,"",1));
         }
      }
      
      private function onMouseDown2(param1:MouseEvent) : void
      {
         this.itemContainer2.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove2);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove2(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.itemContainer2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove2);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_START,"",[this.currItem,2]));
            this.itemContainer2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove2);
         }
      }
      
      private function onItemClick2(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_ENTER,"",[2,this["itemContainer" + 2]]));
         this.itemContainer2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove2);
      }
      
      private function onClick2(param1:MouseEvent) : void
      {
         if(param1.target is ItemFace)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_STONE_CLICK,"",2));
         }
      }
      
      private function onMouseDown3(param1:MouseEvent) : void
      {
         this.itemContainer3.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove3);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove3(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.itemContainer3.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove3);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_START,"",[this.currItem,3]));
            this.itemContainer3.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove3);
         }
      }
      
      private function onItemClick3(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_ENTER,"",[3,this["itemContainer" + 3]]));
         this.itemContainer3.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove3);
      }
      
      private function onClick3(param1:MouseEvent) : void
      {
         if(param1.target is ItemFace)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_STONE_CLICK,"",3));
         }
      }
      
      private function onMouseDown4(param1:MouseEvent) : void
      {
         this.itemContainer4.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove4);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove4(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.itemContainer4.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove4);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_START,"",[this.currItem,4]));
            this.itemContainer4.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove4);
         }
      }
      
      private function onItemClick4(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_ENTER,"",[4,this["itemContainer" + 4]]));
         this.itemContainer4.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove4);
      }
      
      private function onClick4(param1:MouseEvent) : void
      {
         if(param1.target is ItemFace)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_STONE_CLICK,"",4));
         }
      }
      
      private function onMouseDown5(param1:MouseEvent) : void
      {
         this.itemContainer5.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove5);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove5(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.itemContainer5.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove5);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_START,"",[this.currItem,5]));
            this.itemContainer5.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove5);
         }
      }
      
      private function onItemClick5(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_ENTER,"",[5,this["itemContainer" + 5]]));
         this.itemContainer5.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove5);
      }
      
      private function onClick5(param1:MouseEvent) : void
      {
         if(param1.target is ItemFace)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_STONE_CLICK,"",5));
         }
      }
      
      private function onMouseDown6(param1:MouseEvent) : void
      {
         this.itemContainer6.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove6);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove6(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.itemContainer6.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove6);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_START,"",[this.currItem,6]));
            this.itemContainer6.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove6);
         }
      }
      
      private function onItemClick6(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_ENTER,"",[6,this["itemContainer" + 6]]));
         this.itemContainer6.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove6);
      }
      
      private function onClick6(param1:MouseEvent) : void
      {
         if(param1.target is ItemFace)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_STONE_CLICK,"",6));
         }
      }
      
      private function onMouseDown7(param1:MouseEvent) : void
      {
         this.itemContainer7.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove7);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove7(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.itemContainer7.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove7);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_START,"",[this.currItem,7]));
            this.itemContainer7.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove7);
         }
      }
      
      private function onItemClick7(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_ENTER,"",[7,this["itemContainer" + 7]]));
         this.itemContainer7.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove7);
      }
      
      private function onClick7(param1:MouseEvent) : void
      {
         if(param1.target is ItemFace)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_STONE_CLICK,"",7));
         }
      }
      
      private function onMouseDown8(param1:MouseEvent) : void
      {
         this.itemContainer8.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove8);
         this.p = new Point(mouseX,mouseY);
         this.currItem = param1.target as ItemFace;
      }
      
      private function onMouseMove8(param1:MouseEvent) : void
      {
         if(this.currItem != param1.target)
         {
            this.itemContainer8.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove8);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_START,"",[this.currItem,8]));
            this.itemContainer8.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove8);
         }
      }
      
      private function onItemClick8(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_DRAG_ENTER,"",[8,this["itemContainer" + 8]]));
         this.itemContainer8.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove8);
      }
      
      private function onClick8(param1:MouseEvent) : void
      {
         if(param1.target is ItemFace)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ITEM_OPTION_PANEL_STONE_CLICK,"",8));
         }
      }
      
      public function setBtn(param1:int) : void
      {
         var _loc2_:int = 1;
         while(_loc2_ < 13)
         {
            (this["classBtn" + _loc2_] as NewButton).setSkin("zhanhunButton");
            _loc2_++;
         }
         (this["classBtn" + param1] as NewButton).setSkin("zhanhunXuanzhongButton");
      }
      
      public function setItem(param1:McBaseItem, param2:int) : void
      {
         var _loc4_:ItemFace = null;
         var _loc5_:ItemFace = null;
         var _loc3_:int = 0;
         while(_loc3_ < this["itemContainer" + param2].numChildren)
         {
            if(this["itemContainer" + param2].getChildAt(_loc3_) is ItemFace)
            {
               _loc5_ = this["itemContainer" + param2].getChildAt(_loc3_) as ItemFace;
               _loc5_.destroy();
               this["itemContainer" + param2].removeChildAt(_loc3_);
            }
            _loc3_++;
         }
         if(param1 == null)
         {
            return;
         }
         if(_loc4_ != null && _loc4_.parent != null)
         {
            _loc4_.parent.removeChild(_loc4_);
         }
         _loc4_ = new ItemFace(param1);
         _loc4_.setMcName(true);
         _loc4_.x = -7;
         _loc4_.y = -8;
         this["itemContainer" + param2].addChild(_loc4_);
      }
      
      public function setDakong(param1:int) : void
      {
         var _loc3_:Bitmap = null;
         var _loc4_:int = 0;
         var _loc2_:int = 1;
         while(_loc2_ < 9)
         {
            _loc4_ = 0;
            while(_loc4_ < this["itemContainer" + _loc2_].numChildren)
            {
               if(this["itemContainer" + _loc2_].getChildAt(_loc4_) is Bitmap)
               {
                  this["itemContainer" + _loc2_].removeChildAt(_loc4_);
               }
               _loc4_++;
            }
            _loc2_++;
         }
         param1 += 1;
         while(param1 < 9)
         {
            if(this.suoBg == null)
            {
               this.suoBg = StaticValue.getBitmapByClassName("ui.zhanhundai.suotou.bg");
               this["itemContainer" + param1].addChild(this.suoBg);
               this.suoBg.x = 13;
               this.suoBg.y = 8;
            }
            else
            {
               _loc3_ = new Bitmap(this.suoBg.bitmapData.clone());
               this["itemContainer" + param1].addChild(_loc3_);
               _loc3_.x = 13;
               _loc3_.y = 8;
            }
            param1++;
         }
      }
      
      public function setShuxingNum(param1:int, param2:Array, param3:Boolean) : void
      {
         this.fta.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         var _loc4_:String = "";
         _loc4_ = _loc4_ + ("<textformat leading=\'1\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("战魂属性加成") + "：");
         if(param2[0] != 0)
         {
            _loc4_ += LanResManager.getLanCommonTextWords("攻击:") + param2[0] + " ";
         }
         if(param2[1] != 0)
         {
            _loc4_ += LanResManager.getLanCommonTextWords("防御:") + param2[1] + " ";
         }
         if(param2[2] != 0)
         {
            _loc4_ += LanResManager.getLanCommonTextWords("生命:") + param2[2] + " ";
         }
         if(param2[3] != 0)
         {
            _loc4_ += LanResManager.getLanCommonTextWords("内力:") + param2[3] + " ";
         }
         if(param2[4] != 0)
         {
            _loc4_ += LanResManager.getLanCommonTextWords("体力") + ":" + param2[4] + " ";
         }
         if(param2[5] != 0)
         {
            _loc4_ += LanResManager.getLanCommonTextWords("暴击:") + param2[5] + " ";
         }
         if(param2[6] != 0)
         {
            _loc4_ += LanResManager.getLanCommonTextWords("闪避:") + param2[6] + " ";
         }
         if(param2[7] != 0)
         {
            _loc4_ += LanResManager.getLanCommonTextWords("暴击伤害减免比例") + ":" + param2[7] / 100 + "%" + " ";
         }
         if(param2[8] != 0)
         {
            _loc4_ += LanResManager.getLanCommonTextWords("暗器伤害减免比例") + ":" + param2[8] / 100 + "%" + " ";
         }
         if(param2[9] != 0)
         {
            _loc4_ += LanResManager.getLanCommonTextWords("抵抗对方暗器几率") + ":" + param2[9] / 100 + "%" + " ";
         }
         if(param2[10] != 0)
         {
            _loc4_ += LanResManager.getLanCommonTextWords("抵抗对方弓箭几率") + ":" + param2[10] / 100 + "%" + " ";
         }
         if(param2[11] != 0)
         {
            _loc4_ += LanResManager.getLanCommonTextWords("抵抗对方丹田几率") + ":" + param2[11] / 100 + "%" + " ";
         }
         _loc4_ += "</font><br>" + "</textformat>";
         this.fta2.htmlText = _loc4_;
      }
      
      public function setShuxingVis(param1:Boolean) : void
      {
         this.fta.visible = param1;
         this.fta2.visible = param1;
      }
      
      public function setBtnEnbale() : void
      {
         this.zhanhunBtn.enabled = false;
         var _loc1_:int = 1;
         while(_loc1_ < 9)
         {
            (this["itemContainer" + _loc1_] as Sprite).mouseEnabled = false;
            _loc1_++;
         }
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.ZHANHUN_YINGXIONGSHOUWEI_ID];
            this.check.visible = GameState.dictMainStatus[SpecialGoodsID.ZHANHUN_YINGXIONGSHOUWEI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.ZHANHUN_AOJIANWULISHI_ID];
            this.suipian = GameState.dictMainStatus[SpecialGoodsID.ZHANHUN_AOJIANWULISHI_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.ZHANHUN_WUYINGMIJI_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.ZHANHUN_SHENQISHU_ID];
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.ZHANHUN_MOLISHI_ID];
            this.molishi = GameState.dictMainStatus[SpecialGoodsID.ZHANHUN_MOLISHI_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.ZHANHUN_YINGXIONGSHOUWEI_ID];
            this.check.visible = GameState.dictTargetStatus[SpecialGoodsID.ZHANHUN_YINGXIONGSHOUWEI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.ZHANHUN_AOJIANWULISHI_ID];
            this.suipian = GameState.dictTargetStatus[SpecialGoodsID.ZHANHUN_AOJIANWULISHI_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.ZHANHUN_WUYINGMIJI_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.ZHANHUN_SHENQISHU_ID];
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.ZHANHUN_MOLISHI_ID];
            this.molishi = GameState.dictTargetStatus[SpecialGoodsID.ZHANHUN_MOLISHI_ID];
         }
      }
      
      public function isZhanHunHuanZhuang(param1:Boolean) : void
      {
         this.check.selectState = param1;
      }
   }
}

