package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFieldAutoSize;
   import gs.TweenMax;
   
   public class JinChanTuoQiao extends Sprite
   {
      
      public static const UI_JINCHANTUOQIAO_GUANBI_CLICK:String = "UI_JINCHANTUOQIAO_GUANBI_CLICK";
      
      private var bg1:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var jinchantuoqiao:JinChanTuoQiaoTupoCanvas;
      
      private var _$parent:DisplayObject;
      
      public const JINCHANTUOQIAO_MAX:int = 16;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var p:Point;
      
      private var kuang:Bitmap;
      
      private var mainSkill:Skill;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var bb:int = 0;
      
      private var bgSpr:Sprite;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      public function JinChanTuoQiao()
      {
         var miaoshu:FTextArea;
         var fjjn:FTextArea;
         var $mask:Sprite;
         var box:FCanvas = null;
         var title:FTextArea = null;
         super();
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 0;
         box.y = 0;
         box.width = 403;
         box.height = 366;
         this.bgSpr = new Sprite();
         this.bgSpr.x = 0;
         this.bgSpr.y = 0;
         addChild(this.bgSpr);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/jinchantuoqiao/bg.swf");
         this.bg1.x = 2;
         this.bg1.y = 2;
         addChild(this.bg1);
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 2;
         box.y = 231;
         box.width = 400;
         box.height = 135;
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 52;
         this.bloodMcSpr.y = 0;
         addChild(this.bloodMcSpr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116;
         this.shangyiyeButton.y = 205;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         this.cengshu.autoSize;
         addChild(this.cengshu);
         this.cengshu.multiline = true;
         this.cengshu.autoSize = TextFieldAutoSize.LEFT;
         this.cengshu.wordWrap = true;
         this.cengshu.width = 150;
         this.cengshu.height = 30;
         this.cengshu.x = 180 - 50 + 13;
         this.cengshu.y = 205;
         this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("金蝉脱壳第一式") + "</font>";
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16;
         this.xiayiyeButton.y = 205;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50;
         this.tishengBtn.y = 205;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 110;
         title.x = 24;
         title.y = 250;
         title.textColor = StaticValue.ORANGE;
         title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("金蝉脱壳") + "</font></textformat>";
         addChild(title);
         miaoshu = new FTextArea();
         miaoshu.autoSize;
         addChild(miaoshu);
         miaoshu.multiline = true;
         miaoshu.autoSize = TextFieldAutoSize.LEFT;
         miaoshu.wordWrap = true;
         miaoshu.width = 230 - 50;
         miaoshu.x = 24;
         miaoshu.y = 270 + 10;
         miaoshu.htmlText = "<font  size = \'14\' color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("江湖绝技，使用后，可立即解除自身大部分减益状态。纵横江湖，自在逍遥，必备神技。") + "</font>";
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 100;
         this.shuxing.height = 110;
         this.shuxing.x = 210;
         this.shuxing.y = 250;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         this.shuxing.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("增加属性：") + "<br>1000<br>222<br>333<br>444<br>555</font>";
         fjjn = new FTextArea();
         fjjn.multiline = true;
         fjjn.filters = StaticValue.filter;
         fjjn.width = 100;
         fjjn.height = 110;
         fjjn.x = 205 + 112 - 9;
         fjjn.y = 255 + 5 + 5;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font size = \'16\'color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("附加技能") + "</font></textformat>";
         addChild(fjjn);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 303 + 20;
         this.kuang.y = 298;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 325;
         this.mainSkillContainer.y = 300;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.jinchantuoqiao = new JinChanTuoQiaoTupoCanvas();
         addChild(this.jinchantuoqiao);
         this.jinchantuoqiao.x = 138;
         this.jinchantuoqiao.y = 0;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -5;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.jinchantuoqiao.mask = $mask;
         addEventListener(UI_JINCHANTUOQIAO_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("金蝉无双破阵心法（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击5688888888888 防御4288888888888 血量6088888888888暴击 88888闪避88888   所有武功1000000层") + "<br>" + LanResManager.getLanCommonTextWords("破阵心法 -- 激活此心法的玩家可获得永久BUFF，可100%抵抗天门、云龙、玄襄三大阵法的阵中大将技能效果。") + "<br>" + LanResManager.getLanCommonTextWords("并且每次攻击对手都有几率使对手的勋章技能在下一次攻击时无法触发！") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("多重分身术秘籍 （已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：50888亿、防御40888亿、血量60888亿、所有武功提升 408888层") + "<br>" + LanResManager.getLanCommonTextWords("多重分身术：能以一身分出几身，几十身，乃至无穷尽身。相传道教创造人之一的张道陵精通此") + "<br>" + LanResManager.getLanCommonTextWords("术。被攻击8次100%触发三重分身术效果，同时分身三个在原地迷惑对手，分身持续15秒。当触发分") + "<br>" + LanResManager.getLanCommonTextWords("身时，将立即清除自身所有负面BUFF，且不管对手攻击到任何分身都将被反噬定身，持续5秒。技能") + "<br>" + LanResManager.getLanCommonTextWords("冷却90秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function tupoclick(param1:MouseEvent) : void
      {
         if(this.bb == 0)
         {
            this.showTuPoPanel(true);
         }
         else if(this.bb == 1)
         {
            this.showTuPoPanel(false);
         }
         this.jinchantuoqiao.setGoods(new Goods(2001),true);
      }
      
      private function jinengFun(param1:MouseEvent) : void
      {
         this.setShuxingJiacheng(100,100,100,100,100);
         this.setSkill(2004,true);
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shangyiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINCHANTUOQIAO_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINCHANTUOQIAO_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               if(this.tupoBo)
               {
                  return;
               }
               if(this.jinchantuoqiao.x > 138)
               {
                  return;
               }
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINCHANTUOQIAO_TUPO_CLICK,"",this.lookingId));
         }
      }
      
      private function onSkillMouseDown(param1:MouseEvent) : void
      {
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onSkillMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINCHANTUOQIAO_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.jinchantuoqiao._parent2 = param1;
         this.jinchantuoqiao._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:Boolean) : void
      {
         this.setBg(param2);
         this.setShuxingJiacheng(param5,param6,param7,param8,param9);
         this.setZhaoShiMsg(param3,param2,param4);
         this.setSkill(param10,param11);
         this.setJiHuo(param1);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.JINCHANWUSHUANG_POZHENXINFA_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.JINCHANTUOQIAO_DUOCHONGFENSHEN_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.JINCHANWUSHUANG_POZHENXINFA_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.JINCHANTUOQIAO_DUOCHONGFENSHEN_ID];
         }
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var id:int = param1;
         mcId = 0;
         if(id < 6)
         {
            mcId = 1;
         }
         else if(id >= 6 && id <= 10)
         {
            mcId = 2;
         }
         else if(id > 10 && id <= 15)
         {
            mcId = 3;
         }
         else if(id == 16)
         {
            mcId = 4;
         }
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/jinchantuoqiao/" + mcId + ".swf";
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         if(this.mcObj[mcId] != null)
         {
            this.bloodMc = this.mcObj[mcId];
            this.bloodMc.play();
            this.bloodMcSpr.addChild(this.bloodMc);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(bloodMc) && bloodMc.parent != null)
               {
                  bloodMc.stop();
                  bloodMc.parent.removeChild(bloodMc);
               }
               while(bloodMcSpr.numChildren > 0)
               {
                  bloodMcSpr.removeChildAt(0);
               }
               bloodMc = _loc2_.content as MovieClip;
               mcObj[mcId] = bloodMc;
               if(bloodMc)
               {
                  bloodMcSpr.addChild(bloodMc);
               }
            },null,false,loadUrl);
         }
      }
      
      public function removeMc() : void
      {
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
      }
      
      public function setShuxingJiacheng(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.shuxing.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("增加属性：") + "<br>" + LanResManager.getLanCommonTextWords("攻击:") + param1 + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param2 + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("内力:") + param4 + "<br>" + LanResManager.getLanCommonTextWords("体力:") + param5 + "</font>";
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int = -1) : void
      {
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.nowId = param3;
         this.lookingId = param2;
         if(this.tupoBo)
         {
            this.shangyiyeButton.enabled = false;
            this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
            this.tishengBtn.enabled = false;
            this.xiayiyeButton.enabled = false;
         }
         else
         {
            if(param2 <= 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            else
            {
               this.shangyiyeButton.enabled = true;
            }
            if(param2 >= this.JINCHANTUOQIAO_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
            else
            {
               this.xiayiyeButton.enabled = true;
            }
            if(param2 < param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("已领悟");
               this.tishengBtn.enabled = false;
            }
            else if(param2 == param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
               this.tishengBtn.enabled = true;
            }
            else if(param2 > param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("不可领悟");
               this.tishengBtn.enabled = false;
            }
         }
      }
      
      public function setSkill(param1:int, param2:Boolean) : void
      {
         while(this.mainSkillContainer.numChildren > 0)
         {
            this.mainSkillContainer.removeChildAt(0);
         }
         if(this.mainSkillItemFace)
         {
            if(this.mainSkillItemFace.parent)
            {
               this.mainSkillItemFace.parent.removeChild(this.mainSkillItemFace);
            }
         }
         var _loc3_:Skill = new Skill(param1);
         this.mainSkill = _loc3_;
         if(param2)
         {
            this.mainSkill.isLearn = 1;
         }
         else
         {
            this.mainSkill.isLearn = 0;
         }
         this.mainSkillItemFace = new ItemFace(this.mainSkill);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.jinchantuoqiao.x == 138)
            {
               TweenMax.to(this.jinchantuoqiao,1,{"x":410});
               this.tupoBo = true;
               this.bb = 1;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.jinchantuoqiao.x == 410)
            {
               TweenMax.to(this.jinchantuoqiao,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINCHANTUOQIAO_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.bb = 0;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.JINCHANTUOQIAO_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.jinchantuoqiao.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.jinchantuoqiao.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.jinchantuoqiao.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.jinchantuoqiao.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.jinchantuoqiao.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
      }
   }
}

