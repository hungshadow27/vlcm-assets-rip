package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.manager.RslLoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import flash.utils.Dictionary;
   import gs.TweenMax;
   
   public class Liumaishenjian extends Sprite
   {
      
      public static const UI_LIUMAISHENJIAN_GUANBI_CLICK:String = "UI_LIUMAISHENJIAN_GUANBI_CLICK";
      
      public var _parent:DisplayObject;
      
      private var fc:FCanvas;
      
      private var loadUrl:String;
      
      private var btn:SecondButton;
      
      private var xiuLianBtn:SmallButton;
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      private var ftaTotal:FTextArea;
      
      private var fta2:FTextArea;
      
      private var miaoshuFta:FTextArea;
      
      private var miaoshuTitleFta:FTextArea;
      
      private var skillFta:FTextArea;
      
      public var tupoBo:Boolean = false;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var dqcs:FTextArea;
      
      private var tf:TextFormat;
      
      private var skillContainer:Sprite;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var liumaishenjiantupoCanvas:LiumaishenjianTupoCanvas;
      
      private var gongImg:DisplayObject;
      
      private var dqId:int;
      
      private var curShowMc:MovieClip;
      
      private var sprite:Sprite;
      
      private var ary1:Array;
      
      public var bgImg:Bitmap;
      
      private var liumaiMc:MovieClip = null;
      
      private var mcDict:Dictionary;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var toolTipStr1:String = "";
      
      private var toolTipStr2:String = "";
      
      private var toolTipStr3:String = "";
      
      private var toolTipStr4:String = "";
      
      private var toolTipStr5:String = "";
      
      private var toolTipStr6:String = "";
      
      private var fts:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var fts4:FTextArea;
      
      private var fts5:FTextArea;
      
      private var fts6:FTextArea;
      
      private var fts7:FTextArea;
      
      private var fts8:FTextArea;
      
      private var fts9:FTextArea;
      
      private var kuang:Bitmap;
      
      private var mainSkillItemFace1:ItemFace;
      
      public function Liumaishenjian()
      {
         var $mask:Sprite;
         var loadComplete:Function;
         var loadError:Function;
         this.ary1 = [];
         this.mcDict = new Dictionary();
         super();
         if(!this.liumaiMc)
         {
            loadComplete = function():void
            {
            };
            loadError = function(param1:*):*
            {
            };
            this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/liumaishenjian/liumaishenjian.swf";
            RslLoaderManager.load([new LoadData(this.loadUrl,null,null,loadError,"liumaishenjian","liumaishenjian",0)],loadComplete);
         }
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
         this.bgImg = new Bitmap();
         this.bgImg.x = 2;
         this.bgImg.y = 2;
         this.bgImg.name = "ui.liumaishenjian.bg.ui";
         addChild(this.bgImg);
         this.fc = new FCanvas();
         this.fc.width = 403;
         this.fc.height = 366;
         this.fc.skin = "box_transparence";
         addChild(this.fc);
         this.sprite = new Sprite();
         this.sprite.x = 24;
         this.sprite.y = 6;
         addChild(this.sprite);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 306;
            y = 13;
            textColor = StaticValue.BLUE;
            htmlText = "";
         }
         addChild(this.fta);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 306;
            y = 33;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta1);
         this.ftaTotal = new FTextArea();
         with(this.ftaTotal)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 306;
            y = 135;
            textColor = StaticValue.BLUE;
            htmlText = LanResManager.getLanCommonTextWords("六脉神剑总加成");
         }
         addChild(this.ftaTotal);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            x = 306;
            y = 155;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta2);
         this.miaoshuTitleFta = new FTextArea();
         with(this.miaoshuTitleFta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 170;
            textColor = StaticValue.BlUE20;
            htmlText = LanResManager.getLanCommonTextWords("六脉神剑介绍");
         }
         addChild(this.miaoshuTitleFta);
         this.miaoshuFta = new FTextArea();
         with(this.miaoshuFta)
         {
            filters = StaticValue.filter;
            width = 90;
            height = 100;
            wordWrap = true;
            x = 10;
            y = 190;
            textColor = StaticValue.GREEN;
            htmlText = "";
         }
         addChild(this.miaoshuFta);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 147;
         this.previousButton.y = 276;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 232;
         this.nextButton.y = 276;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.dqcs = new FTextArea();
         with(this.dqcs)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 50;
            height = 16;
            x = 174;
            y = 277;
            background = true;
            backgroundColor = 1186072;
            textColor = StaticValue.BlUE20;
            htmlText = "";
         }
         addChild(this.dqcs);
         this.xiuLianBtn = new SmallButton();
         this.xiuLianBtn.label = LanResManager.getLanCommonTextWords("开始修炼");
         addChild(this.xiuLianBtn);
         this.xiuLianBtn.x = 315;
         this.xiuLianBtn.y = 274;
         this.xiuLianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.skillFta = new FTextArea();
         with(this.skillFta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 8;
            y = 305;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("六脉神剑技能");
         }
         addChild(this.skillFta);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.visible = false;
         this.kuang.x = 330 + 23 - 111;
         this.kuang.y = 305 - 270 + 12 + 180;
         this.skillContainer = new Sprite();
         addChild(this.skillContainer);
         with(this.skillContainer)
         {
            x = 11;
            y = 323;
         }
         this.skillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.skillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.liumaishenjiantupoCanvas = new LiumaishenjianTupoCanvas();
         addChild(this.liumaishenjiantupoCanvas);
         this.liumaishenjiantupoCanvas.x = 138;
         this.liumaishenjiantupoCanvas.y = -10;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -10;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,280,390);
            endFill();
         }
         this.liumaishenjiantupoCanvas.mask = $mask;
         addEventListener(UI_LIUMAISHENJIAN_GUANBI_CLICK,this.aa1);
         this.fts = new FTextArea();
         this.fts.x = 115;
         this.fts.y = 10;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("六脉最终式(未激活)");
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击2888888、防御 2288888、血量388888888、暴击888、闪避 888。提升人物攻击、防御、血量、暴击、闪避属性10% ") + "<br>" + LanResManager.getLanCommonTextWords("六脉神剑终极伤害：攻击时，每攻击对手六次，必定100%触发五倍伤害。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 115;
         this.fts2.y = 30;
         this.fts2.textColor = StaticValue.RED;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("六脉合一(未激活)");
         addChild(this.fts2);
         this.fts2.visible = false;
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击8888888 防御6888888 血量18888888 暴击88 闪避88 人物攻击属性提升15% 青龙战纹5%") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 115;
         this.fts3.y = 30 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("关冲天剑剑谱(已激活)");
         addChild(this.fts3);
         this.fts3.visible = false;
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("关冲天剑属性：攻击388亿、防御188亿、血量1000亿、暴击3000、闪避3000") + "<br>" + LanResManager.getLanCommonTextWords("关冲天剑技能：命中对手后可使对手神魂颠倒，方向混乱，效果持续6秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 115;
         this.fts4.y = 30 + 20 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("少冲天剑剑谱(已激活)");
         addChild(this.fts4);
         this.fts4.visible = false;
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("少冲天剑属性：攻击388亿、防御188亿、血量1000亿、暴击3000、闪避3000") + "<br>" + LanResManager.getLanCommonTextWords("少冲天剑技能：命中对手后可使对手每秒损失20%的当前血量，效果持续6秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts5 = new FTextArea();
         this.fts5.x = 115;
         this.fts5.y = 30 + 20 + 20 + 20;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 170;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("商阳天剑剑谱(已激活)");
         addChild(this.fts5);
         this.fts5.visible = false;
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("商阳天剑属性：攻击388亿、防御188亿、血量1000亿、暴击3000、闪避3000") + "<br>" + LanResManager.getLanCommonTextWords("商阳天剑技能：命中对手后可使对手武功全部冻结，无法攻击，效果持续6秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts6 = new FTextArea();
         this.fts6.x = 115;
         this.fts6.y = 30 + 20 + 20 + 20 + 20;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 170;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("中冲天剑剑谱(已激活)");
         addChild(this.fts6);
         this.fts6.visible = false;
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("中冲天剑属性：攻击388亿、防御188亿、血量1000亿、暴击3000、闪避3000") + "<br>" + LanResManager.getLanCommonTextWords("中冲天剑技能：命中对手后将可以瞬间对对手造成十倍伤害！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts7 = new FTextArea();
         this.fts7.x = 115;
         this.fts7.y = 30 + 20 + 20 + 20 + 20 + 20;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 170;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("少泽天剑剑谱(已激活)");
         addChild(this.fts7);
         this.fts7.visible = false;
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("少泽天剑属性：攻击388亿、防御188亿、血量1000亿、暴击3000、闪避3000") + "<br>" + LanResManager.getLanCommonTextWords("少泽天剑技能：命中对手后将可以使对手降低50%的属性，持续6秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts8 = new FTextArea();
         this.fts8.x = 115;
         this.fts8.y = 30 + 20 + 20 + 20 + 20 + 20 + 20;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.width = 170;
         this.fts8.height = 20;
         this.fts8.htmlText = LanResManager.getLanCommonTextWords("少商天剑剑谱(已激活)");
         addChild(this.fts8);
         this.fts8.visible = false;
         ToolTips.createToolTips(this.fts8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("少商天剑属性：攻击388亿、防御188亿、血量1000亿、暴击3000、闪避3000") + "<br>" + LanResManager.getLanCommonTextWords("少商天剑技能：命中对手后将可以使降低对手50%的攻击速度和移动速度，持续6秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts9 = new FTextArea();
         this.fts9.x = 115;
         this.fts9.y = 10;
         this.fts9.visible = false;
         this.fts9.textColor = StaticValue.GREEN;
         this.fts9.width = 170;
         this.fts9.height = 20;
         this.fts9.htmlText = LanResManager.getLanCommonTextWords("剑体封印(已激活)");
         addChild(this.fts9);
         ToolTips.createToolTips(this.fts9,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("弟子双击使用可开启六脉神剑主动技能：剑体封印,激活剑体封印的玩家将可") + "<br>" + LanResManager.getLanCommonTextWords("锁定任意一个玩家，施发剑体封印可将对手封印在轩辕剑内，对手将变成一") + "<br>" + LanResManager.getLanCommonTextWords("把轩辕剑束缚于原地无法移动，持续10秒。冷却60秒！（可在城里使用）") + "</font>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.onShowLv(false);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._parent = param1;
         this.liumaishenjiantupoCanvas._parent2 = param1;
         this.liumaishenjiantupoCanvas._parent3 = this;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIUMAISHENJIAN_PREVIOUS_CLICK));
               break;
            case this.nextButton:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIUMAISHENJIAN_NEXT_CLICK));
               break;
            case this.xiuLianBtn:
               this.onShowLv(true);
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIUMAISHENJIAN_XIULIAN_CLICK));
         }
      }
      
      private function onClick1(param1:MouseEvent) : void
      {
         this.fta.htmlText = param1.currentTarget.label + LanResManager.getLanCommonTextWords("加成");
         this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SHENJIAN_EVENT_CLICK,"",param1.currentTarget.name));
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.skillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.skillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIUMAISHENJIAN_SKILL_DRAG,"",this.currSkill));
            }
            this.skillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.skillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function onMouseTip1(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               param1.currentTarget.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(param1.currentTarget.label == LanResManager.getLanCommonTextWords("关冲剑"))
               {
                  this.showTip(this.toolTipStr1);
               }
               else if(param1.currentTarget.label == LanResManager.getLanCommonTextWords("少冲剑"))
               {
                  this.showTip(this.toolTipStr2);
               }
               else if(param1.currentTarget.label == LanResManager.getLanCommonTextWords("商阳剑"))
               {
                  this.showTip(this.toolTipStr3);
               }
               else if(param1.currentTarget.label == LanResManager.getLanCommonTextWords("中冲剑"))
               {
                  this.showTip(this.toolTipStr4);
               }
               else if(param1.currentTarget.label == LanResManager.getLanCommonTextWords("少泽剑"))
               {
                  this.showTip(this.toolTipStr5);
               }
               else if(param1.currentTarget.label == LanResManager.getLanCommonTextWords("少商剑"))
               {
                  this.showTip(this.toolTipStr6);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               param1.currentTarget.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      public function setJianshuBtn(param1:Array) : void
      {
         this.ary1 = param1;
         while(this.sprite.numChildren > 0)
         {
            this.sprite.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.btn = new SecondButton();
            this.btn.label = param1[_loc2_].name;
            this.sprite.addChild(this.btn);
            this.btn.y = _loc2_ * 25 + 8;
            this.btn.name = param1[_loc2_].id;
            this.btn.addEventListener(MouseEvent.CLICK,this.onClick1);
            this.btn.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
            this.btn.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
            _loc2_++;
         }
      }
      
      public function menuToolTip(param1:Array) : void
      {
         this.toolTipStr1 = param1[0];
         this.toolTipStr2 = param1[1];
         this.toolTipStr3 = param1[2];
         this.toolTipStr4 = param1[3];
         this.toolTipStr5 = param1[4];
         this.toolTipStr6 = param1[5];
      }
      
      public function setSkill(param1:Array, param2:Boolean) : void
      {
         var _loc3_:ItemFace = null;
         var _loc4_:Bitmap = null;
         while(this.skillContainer.numChildren > 0)
         {
            this.skillContainer.removeChildAt(0);
         }
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc4_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            if(_loc5_ == param1.length - 1)
            {
               _loc4_.x = _loc5_ * 49 + 47;
            }
            else
            {
               _loc4_.x = _loc5_ * 49;
            }
            _loc3_ = new ItemFace(param1[_loc5_]);
            _loc3_.showKungFuTag();
            _loc3_.setShowCount(false);
            _loc3_.x = _loc4_.x + 2;
            _loc3_.y = _loc4_.y + 2;
            if(!param2)
            {
               _loc3_.removeListener();
            }
            this.skillContainer.addChild(_loc4_);
            this.skillContainer.addChild(_loc3_);
            _loc5_++;
         }
      }
      
      public function setMiaoshu(param1:String) : void
      {
         this.miaoshuFta.htmlText = "<font size=\'12\'>" + param1 + "</font>";
      }
      
      public function setShuxingNum(param1:Array, param2:Array) : void
      {
         var _loc3_:String = "<textformat leading=\'4\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + param1[0].act + "<br>" + LanResManager.getLanCommonTextWords("防御：") + param1[0].def + "<br>" + LanResManager.getLanCommonTextWords("生命：") + param1[0].hp + "<br>" + LanResManager.getLanCommonTextWords("暴击：") + param1[0].mp + "<br>" + LanResManager.getLanCommonTextWords("闪避：") + param1[0].cp + "</font></textformat>";
         var _loc4_:String = "<textformat leading=\'4\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + param2[0].actMax + "<br>" + LanResManager.getLanCommonTextWords("防御：") + param2[0].defMax + "<br>" + LanResManager.getLanCommonTextWords("生命：") + param2[0].hpMax + "<br>" + LanResManager.getLanCommonTextWords("暴击：") + param2[0].mpMax + "<br>" + LanResManager.getLanCommonTextWords("闪避：") + param2[0].cpMax + "</font></textformat>";
         this.fta1.htmlText = _loc3_;
         this.fta2.htmlText = _loc4_;
      }
      
      public function setDengji(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc6_:MovieClip = null;
         this.dqId = param2;
         this.fta.htmlText = this.ary1[param1 - 1].name + LanResManager.getLanCommonTextWords("加成");
         if(param2 == 1)
         {
            this.dqcs.htmlText = LanResManager.getLanCommonTextWords("第一重");
            this.previousButton.enabled = false;
            this.nextButton.enabled = true;
         }
         else if(param2 == 2)
         {
            this.dqcs.htmlText = LanResManager.getLanCommonTextWords("第二重");
            this.previousButton.enabled = true;
            this.nextButton.enabled = true;
         }
         else if(param2 == 3)
         {
            this.dqcs.htmlText = LanResManager.getLanCommonTextWords("第三重");
            this.previousButton.enabled = true;
            this.nextButton.enabled = false;
         }
         if(param2 < param3)
         {
            this.xiuLianBtn.label = LanResManager.getLanCommonTextWords("已修炼");
            this.xiuLianBtn.enabled = false;
         }
         else if(param2 == param3)
         {
            if(param4 == 1)
            {
               this.xiuLianBtn.label = LanResManager.getLanCommonTextWords("开始修炼");
               this.xiuLianBtn.enabled = true;
            }
            else
            {
               this.xiuLianBtn.label = LanResManager.getLanCommonTextWords("未修炼");
               this.xiuLianBtn.enabled = false;
            }
         }
         else
         {
            this.xiuLianBtn.label = LanResManager.getLanCommonTextWords("未修炼");
            this.xiuLianBtn.enabled = false;
         }
         var _loc5_:String = "ui.liumaishenjian.shenjian" + param1;
         if(!this.mcDict[_loc5_])
         {
            _loc6_ = StaticValue.getMCByClassName(_loc5_) as MovieClip;
            if(_loc6_)
            {
               if(param1 == 1)
               {
                  _loc6_.x = 172;
                  _loc6_.y = 44;
               }
               else if(param1 == 2)
               {
                  _loc6_.x = 148;
                  _loc6_.y = 64;
               }
               else if(param1 == 3)
               {
                  _loc6_.x = 121;
                  _loc6_.y = 70;
               }
               else if(param1 == 4)
               {
                  _loc6_.x = 118;
                  _loc6_.y = 128;
               }
               else if(param1 == 5)
               {
                  _loc6_.x = 132;
                  _loc6_.y = 70;
               }
               else if(param1 == 6)
               {
                  _loc6_.x = 143;
                  _loc6_.y = 117;
               }
               if(Boolean(this.curShowMc) && Boolean(this.curShowMc.parent))
               {
                  this.curShowMc.parent.removeChild(this.curShowMc);
               }
               this.curShowMc = _loc6_;
            }
            this.mcDict[_loc5_] = _loc6_;
         }
         else if(this.curShowMc != this.mcDict[_loc5_])
         {
            if(this.curShowMc.parent)
            {
               this.curShowMc.parent.removeChild(this.curShowMc);
            }
            this.curShowMc = this.mcDict[_loc5_];
         }
         if(this.curShowMc)
         {
            addChildAt(this.curShowMc,2);
            this.curShowMc.gotoAndStop(param2);
         }
      }
      
      public function loadPicture(param1:int) : void
      {
         if(this.gongImg != null && this.gongImg.parent != null)
         {
            this.gongImg.parent.removeChild(this.gongImg);
         }
         this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/liumaishenjian/" + param1 + ".jpg",185,290);
         this.gongImg.x = 108;
         this.gongImg.y = 6;
         addChildAt(this.gongImg,1);
      }
      
      public function reManbanBo() : Boolean
      {
         return this.tupoBo;
      }
      
      public function setJiHuo(param1:Boolean, param2:Boolean) : void
      {
         if(param1)
         {
            this.fts.textColor = StaticValue.GREEN;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("六脉最终式(已激活)");
         }
         else
         {
            this.fts.textColor = StaticValue.RED;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("六脉最终式(未激活)");
         }
         if(param2)
         {
            if(GameState.dictMainStatus[40793])
            {
               this.fts2.textColor = StaticValue.GREEN;
               this.fts2.htmlText = LanResManager.getLanCommonTextWords("六脉合一(已激活)");
               this.fts2.visible = true;
            }
            else
            {
               this.fts2.textColor = StaticValue.RED;
               this.fts2.htmlText = LanResManager.getLanCommonTextWords("六脉合一(未激活)");
               this.fts2.visible = false;
            }
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_GUANCHONGJIAN_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOCHONGJIAN_ID];
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHANGYANGJIAN_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_ZHONGCHONGJIAN_ID];
            this.fts7.visible = GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOZEJIAN_ID];
            this.fts8.visible = GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOSHANGJIAN_ID];
            this.fts.visible = !GameInstance.mainCharData.isDiZi;
            if(GameInstance.mainCharData.isDiZi)
            {
               this.fts9.visible = GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_JIANTIFENGYIN_ID];
               if(GameState.dictMainStatus[SpecialGoodsID.LIUMAISHENJIAN_JIANTIFENGYIN_ID])
               {
                  this.setSkillJiHuo(200323,true);
                  this.mainSkillItemFace1.visible = true;
                  this.kuang.visible = true;
               }
               else
               {
                  this.mainSkillItemFace1 = null;
                  this.kuang.visible = false;
               }
            }
            else
            {
               this.fts9.visible = false;
               this.kuang.visible = false;
            }
         }
         else
         {
            if(GameState.dictTargetStatus[40793])
            {
               this.fts2.textColor = StaticValue.GREEN;
               this.fts2.htmlText = LanResManager.getLanCommonTextWords("六脉合一(已激活)");
               this.fts2.visible = true;
            }
            else
            {
               this.fts2.textColor = StaticValue.RED;
               this.fts2.htmlText = LanResManager.getLanCommonTextWords("六脉合一(未激活)");
               this.fts2.visible = false;
            }
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.LIUMAISHENJIAN_GUANCHONGJIAN_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOCHONGJIAN_ID];
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.LIUMAISHENJIAN_SHANGYANGJIAN_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.LIUMAISHENJIAN_ZHONGCHONGJIAN_ID];
            this.fts7.visible = GameState.dictTargetStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOZEJIAN_ID];
            this.fts8.visible = GameState.dictTargetStatus[SpecialGoodsID.LIUMAISHENJIAN_SHAOSHANGJIAN_ID];
            this.fts.visible = !GameInstance.lookPlayerData.isDiZi;
            if(GameInstance.lookPlayerData.isDiZi)
            {
               this.fts9.visible = GameState.dictTargetStatus[SpecialGoodsID.LIUMAISHENJIAN_JIANTIFENGYIN_ID];
               if(GameState.dictTargetStatus[SpecialGoodsID.LIUMAISHENJIAN_JIANTIFENGYIN_ID])
               {
                  this.setSkillJiHuo(200323,true);
                  this.mainSkillItemFace1.visible = true;
                  this.kuang.visible = true;
               }
               else
               {
                  this.mainSkillItemFace1 = null;
                  this.kuang.visible = false;
               }
            }
            else
            {
               this.fts9.visible = false;
               this.kuang.visible = false;
            }
         }
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.liumaishenjiantupoCanvas.x == 138)
            {
               TweenMax.to(this.liumaishenjiantupoCanvas,1,{"x":410});
               this.tupoBo = true;
               this.xiuLianBtn.enabled = false;
               this.previousButton.enabled = false;
               this.nextButton.enabled = false;
            }
         }
         else
         {
            if(this.liumaishenjiantupoCanvas.x == 410)
            {
               TweenMax.to(this.liumaishenjiantupoCanvas,1,{"x":138});
               this.tupoBo = false;
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIUMAISHENJIAN_ZIDONGTISHENG_CLICKJ,"",false));
            }
            if(this.xiuLianBtn.label == LanResManager.getLanCommonTextWords("开始修炼"))
            {
               this.xiuLianBtn.enabled = true;
            }
            if(this.dqId == 1)
            {
               this.previousButton.enabled = false;
            }
            else
            {
               this.previousButton.enabled = true;
            }
            if(this.dqId == 3)
            {
               this.nextButton.enabled = false;
            }
            else
            {
               this.nextButton.enabled = true;
            }
         }
      }
      
      public function setTupoInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:String) : void
      {
         this.liumaishenjiantupoCanvas.setInitialize(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setTupoZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.liumaishenjiantupoCanvas.setZhufuzhi(param1,param2,param3);
      }
      
      public function setTupoGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.liumaishenjiantupoCanvas.setGoods(param1,param2);
      }
      
      public function setTupoBtn(param1:Boolean) : void
      {
         this.liumaishenjiantupoCanvas.setBtn(param1);
      }
      
      public function setLiumaishenjianEnabledFun() : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:SecondButton = null;
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
         this.xiuLianBtn.visible = false;
         var _loc1_:int = 0;
         while(_loc1_ < this.ary1.length)
         {
            _loc2_ = this.sprite.getChildByName(String(this.ary1[_loc1_].id));
            _loc3_ = _loc2_ as SecondButton;
            _loc3_.enabled = false;
            _loc1_++;
         }
      }
      
      public function setSkillJiHuo(param1:int, param2:Boolean) : void
      {
         var _loc3_:Skill = new Skill(param1);
         if(param2)
         {
            _loc3_.isLearn = 1;
         }
         else
         {
            _loc3_.isLearn = 0;
         }
         this.mainSkillItemFace1 = new ItemFace(_loc3_);
         this.mainSkillItemFace1.showKungFuTag();
         this.mainSkillItemFace1.setShowCount(false);
         this.mainSkillItemFace1.x = 23 + 204 + 7 - 1;
         this.mainSkillItemFace1.y = 12 - 270 + 167 - 5 + 1 + 1;
         this.skillContainer.addChild(this.mainSkillItemFace1);
      }
   }
}

