package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.shenxingbaibian.model.info.ShenXingBaiBianVO;
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
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class ShenXingBaiBian extends Sprite
   {
      
      public static const UI_SHENXINGBAIBIAN_GUANBI_CLICK:String = "UI_SHENXINGBAIBIAN_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var bg1:DisplayObject;
      
      private var bgan:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var shenxingbaibian:ShenXingBaiBianTupoCanvas;
      
      private var _$parent:DisplayObject;
      
      public const SHENXINGBAIBIAN_MAX:int = 9;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var tf:TextFormat;
      
      private var dianArr:Array;
      
      private var p:Point;
      
      private var kuang:Bitmap;
      
      private var mainSkill:Skill;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var fts1:FTextArea;
      
      private var dounle:Boolean;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var mainSkillContainer1:Sprite;
      
      private var kuang1:Bitmap;
      
      private var currSkill1:ItemFace;
      
      private var p1:Point;
      
      private var mainSkillItemFace1:ItemFace;
      
      private var mainSkill1:Skill;
      
      private var fts4:FTextArea;
      
      private var fts5:FTextArea;
      
      private var check5:FCheckBox;
      
      private var fts6:FTextArea;
      
      private var check6:FCheckBox;
      
      public function ShenXingBaiBian()
      {
         var title:FTextArea;
         var fjjn:FTextArea;
         var $mask:Sprite;
         var box:FCanvas = null;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 0;
         box.y = 0;
         box.width = 403;
         box.height = 366;
         box = new FCanvas();
         box.skin = "box_transparence";
         addChild(box);
         box.x = 2;
         box.y = 231;
         box.width = 400 + 1;
         box.height = 135;
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 2;
         this.bloodMcSpr.y = 2 - 10 + 2 + 2 + 4 + 2;
         addChild(this.bloodMcSpr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37;
         this.shangyiyeButton.y = 205 + 25 - 20 + 25 - 10 - 20;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 170;
         this.cengshu.y = 230 - 20 + 25 - 10 - 20;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16;
         this.xiayiyeButton.y = 205 + 25 - 20 + 25 - 10 - 20;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50;
         this.tishengBtn.y = 205 + 25 - 20 + 25 - 10 - 20;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 110;
         title.x = 24 + 50;
         title.y = 242;
         title.textColor = StaticValue.ORANGE;
         title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("神行百变") + "</font></textformat>";
         addChild(title);
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 230 - 12 - 15;
         this.miaoshu.x = 23 - 11;
         this.miaoshu.y = 263;
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("江湖绝技，使用后，可立即解除自身大部分减益状态。纵横江湖，自在逍遥，必备神技。") + "</font>";
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 100 + 30;
         this.shuxing.height = 110;
         this.shuxing.x = 210 + 13 + 17 - 25;
         this.shuxing.y = 250 + 20 - 3 - 17;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         fjjn = new FTextArea();
         fjjn.multiline = true;
         fjjn.filters = StaticValue.filter;
         fjjn.width = 100;
         fjjn.height = 110;
         fjjn.x = 205 + 112 - 9 + 36 - 15;
         fjjn.y = 255 + 5 + 5 + 6 + 22 - 20;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("顶级技能") + "</font></textformat>";
         addChild(fjjn);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 355 - 30 + 10;
         this.kuang.y = 315 - 20;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 355 + 2 - 30 + 10;
         this.mainSkillContainer.y = 315 + 2 - 20;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.shenxingbaibian = new ShenXingBaiBianTupoCanvas();
         addChild(this.shenxingbaibian);
         this.shenxingbaibian.x = 138;
         this.shenxingbaibian.y = 0;
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
         this.shenxingbaibian.mask = $mask;
         addEventListener(UI_SHENXINGBAIBIAN_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("神行百变顶级（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("增加人物 攻击 1000亿、武功层数 20000层。") + "<br>" + LanResManager.getLanCommonTextWords("特殊效果：神行百变技能冷却时间减半。") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("神行无踪瞬影步（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("增加人物 攻击：15888亿、防御12888亿、血量16888亿、所有武功提升 120000层") + "<br>" + LanResManager.getLanCommonTextWords("技能效果（神行瞬步）：攻击时有几率触发神行瞬步，在此状态下，每次跳跃落地都") + "<br>" + LanResManager.getLanCommonTextWords("将100%无视对手闪避对自身5格范围内的玩家造成2秒眩晕效果，并消耗对手30%的当") + "<br>" + LanResManager.getLanCommonTextWords("前血量，神行瞬步状态持续10秒！") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 20 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("鬼影仙踪秘籍（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("增加人物 攻击：28888亿、防御26888亿、血量30888亿、所有武功提升 240000层") + "<br>" + LanResManager.getLanCommonTextWords("鬼影仙踪（主动技能）：使用该技能时，立即清除自身所有负面状态，并可在当前地图内随机传送一次。技能冷却60秒！") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 + 324;
         this.kuang1.y = 160 + 35 - 186;
         this.mainSkillContainer1 = new Sprite();
         this.mainSkillContainer1.x = 25 + 2 + 324;
         this.mainSkillContainer1.y = 160 + 2 + 35 - 186;
         addChild(this.mainSkillContainer1);
         this.mainSkillContainer1.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown1);
         this.mainSkillContainer1.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp1);
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7 + 20 + 20 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("无尽幻影秘籍（已激活）");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击128888亿 防御108888亿 血量138888亿 暴击 88888闪避 88888 ") + "<br>" + LanResManager.getLanCommonTextWords("所有武功  2500000层") + "<br>" + LanResManager.getLanCommonTextWords("无尽绞杀（特殊技能）：攻击时100%触发无尽绞杀，持续10秒 ；在此状态下，每秒都将触发一") + "<br>" + LanResManager.getLanCommonTextWords("次幻影传送；不管对方在任何位置都可以传送对手面前，每传送一次自身可清除一次所有负面状") + "<br>" + LanResManager.getLanCommonTextWords("态；当传递至对手面前时，可随机使对手100%命中定身、禁武、禁跳其中一个，即使对手在城里，") + "<br>" + LanResManager.getLanCommonTextWords("一样可传送至对手面前进行绞杀。冷却60秒.") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.fts5 = new FTextArea();
         this.fts5.x = 10 + 10;
         this.fts5.y = 7 + 20 + 20 + 20 + 20;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 200;
         this.fts5.height = 20;
         this.fts5.htmlText = new Goods(732209).res.name;
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(732209).res.desc;
            return _loc1_ + "</font></textformat>";
         });
         this.check5 = new FCheckBox();
         addChild(this.check5);
         this.check5.visible = false;
         this.check5.x = 0;
         this.check5.y = 7 + 20 + 20 + 20 + 20;
         this.check5.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts6 = new FTextArea();
         this.fts6.x = 10 + 10;
         this.fts6.y = 7 + 20 + 20 + 20 + 20 + 20;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 200;
         this.fts6.height = 20;
         this.fts6.htmlText = new Goods(732210).res.name;
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + new Goods(732210).res.desc;
            return _loc1_ + "</font></textformat>";
         });
         this.check6 = new FCheckBox();
         addChild(this.check6);
         this.check6.visible = false;
         this.check6.x = 0;
         this.check6.y = 7 + 20 + 20 + 20 + 20 + 20;
         this.check6.addEventListener(MouseEvent.CLICK,this.onCheckClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.check5:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check5.selectState,732209]));
               break;
            case this.check6:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check6.selectState,732210]));
         }
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SHENXINGBAIBIAN_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SHENXINGBAIBIAN_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SHENXINGBAIBIAN_TUPO_CLICK,"",this.lookingId));
               this.showTuPoPanel(true);
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_JINGANGFUMOQUAN_SKILL_DRAG,"",this.currSkill));
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
         this.shenxingbaibian._parent2 = param1;
         this.shenxingbaibian._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:ShenXingBaiBianVO) : void
      {
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.isDouble,param2.miaoshu,param2.act,param2.def,param2.hp,param2.baoji,param2.shanbi,param1);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skillid,param2.isLearn);
         this.setJiHuo(param1);
         this.check5.selectState = param2.isCheck5;
         this.check6.selectState = param2.isCheck6;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.SHENXINGBAIBIAN_DINGJI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.SHENXINGBAIBIAN_SHUNYINGBU_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.SHENXINGBAIBIAN_GUIYINGXIANZHONG_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.SHENXINGBAIBIAN_WUJINHUANYING_ID];
            this.fts5.visible = GameState.dictMainStatus[732209];
            this.check5.visible = this.fts5.visible;
            this.fts6.visible = GameState.dictMainStatus[732210];
            this.check6.visible = this.fts6.visible;
            if(GameInstance.mainCharData.isDiZi)
            {
               if(GameState.dictMainStatus[SpecialGoodsID.DIZI_SHENXINGBAIBIAN_JUEQINGMIJI_ID])
               {
                  this.setSkillJiHuo1(200275,true);
                  this.mainSkillContainer1.visible = true;
                  this.kuang1.visible = true;
               }
               else
               {
                  this.mainSkillContainer1.visible = false;
                  this.kuang1.visible = false;
               }
            }
            else if(GameState.dictMainStatus[SpecialGoodsID.SHENXINGBAIBIAN_GUIYINGXIANZHONG_ID])
            {
               this.setSkillJiHuo1(200227,true);
               this.mainSkillContainer1.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer1.visible = false;
               this.kuang1.visible = false;
            }
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.SHENXINGBAIBIAN_DINGJI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.SHENXINGBAIBIAN_SHUNYINGBU_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.SHENXINGBAIBIAN_GUIYINGXIANZHONG_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.SHENXINGBAIBIAN_WUJINHUANYING_ID];
            this.fts5.visible = GameState.dictTargetStatus[732209];
            this.check5.visible = false;
            this.fts6.visible = GameState.dictTargetStatus[732210];
            this.check6.visible = false;
            if(GameInstance.lookPlayerData.isDiZi)
            {
               if(GameState.dictTargetStatus[SpecialGoodsID.DIZI_SHENXINGBAIBIAN_JUEQINGMIJI_ID])
               {
                  this.setSkillJiHuo1(200275,true);
                  this.mainSkillContainer1.visible = true;
                  this.kuang1.visible = true;
               }
               else
               {
                  this.mainSkillContainer1.visible = false;
                  this.kuang1.visible = false;
               }
            }
            else if(GameState.dictTargetStatus[SpecialGoodsID.SHENXINGBAIBIAN_GUIYINGXIANZHONG_ID])
            {
               this.setSkillJiHuo1(200227,true);
               this.mainSkillContainer1.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer1.visible = false;
               this.kuang1.visible = false;
            }
         }
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var id:int = param1;
         mcId = id;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/shenxingbaibian/" + mcId + ".swf";
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
      
      public function setShuxingJiacheng(param1:*, param2:String, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Boolean) : void
      {
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param2 + "</font>";
         if(param8)
         {
            this.dounle = GameState.dictMainStatus[SpecialGoodsID.SHENXINGBAIBIAN_FANBEI_ID];
            if(this.dounle)
            {
               this.shuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成：") + "<br>" + LanResManager.getLanCommonTextWords("攻击:") + param3 + "X2<br>" + LanResManager.getLanCommonTextWords("防御:") + param4 + "X2<br>" + LanResManager.getLanCommonTextWords("生命:") + param5 + "X2<br>" + LanResManager.getLanCommonTextWords("暴击:") + param6 + "X2<br>" + LanResManager.getLanCommonTextWords("闪避:") + param7 + "X2</font>";
            }
            else
            {
               this.shuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成：") + "<br>" + LanResManager.getLanCommonTextWords("攻击:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param4 + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param5 + "<br>" + LanResManager.getLanCommonTextWords("暴击:") + param6 + "<br>" + LanResManager.getLanCommonTextWords("闪避:") + param7 + "</font>";
            }
         }
         else
         {
            this.dounle = GameState.dictTargetStatus[SpecialGoodsID.SHENXINGBAIBIAN_FANBEI_ID];
            if(this.dounle)
            {
               this.shuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成：") + "<br>" + LanResManager.getLanCommonTextWords("攻击:") + param3 + "X2<br>" + LanResManager.getLanCommonTextWords("防御:") + param4 + "X2<br>" + LanResManager.getLanCommonTextWords("生命:") + param5 + "X2<br>" + LanResManager.getLanCommonTextWords("暴击:") + param6 + "X2<br>" + LanResManager.getLanCommonTextWords("闪避:") + param7 + "X2</font>";
            }
            else
            {
               this.shuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成：") + "<br>" + LanResManager.getLanCommonTextWords("攻击:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param4 + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param5 + "<br>" + LanResManager.getLanCommonTextWords("暴击:") + param6 + "<br>" + LanResManager.getLanCommonTextWords("闪避:") + param7 + "</font>";
            }
         }
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
            if(param2 >= this.SHENXINGBAIBIAN_MAX)
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
         this.mainSkill = new Skill(param1);
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
            if(this.shenxingbaibian.x == 138)
            {
               TweenMax.to(this.shenxingbaibian,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.shenxingbaibian.x == 410)
            {
               TweenMax.to(this.shenxingbaibian,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SHENXINGBAIBIAN_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.SHENXINGBAIBIAN_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.shenxingbaibian.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.shenxingbaibian.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.shenxingbaibian.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.shenxingbaibian.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.shenxingbaibian.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
      }
      
      private function onSkillMouseDown1(param1:MouseEvent) : void
      {
         this.mainSkillContainer1.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove1);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onSkillMouseMove1(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.mainSkillContainer1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove1);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove1);
         }
      }
      
      private function onSkillMouseUp1(param1:MouseEvent) : void
      {
         this.mainSkillContainer1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove1);
      }
      
      public function setSkillJiHuo1(param1:int, param2:Boolean) : void
      {
         while(this.mainSkillContainer1.numChildren > 0)
         {
            this.mainSkillContainer1.removeChildAt(0);
         }
         if(this.mainSkillItemFace1)
         {
            if(this.mainSkillItemFace1.parent)
            {
               this.mainSkillItemFace1.parent.removeChild(this.mainSkillItemFace1);
            }
         }
         var _loc3_:Skill = new Skill(param1);
         this.mainSkill1 = _loc3_;
         if(param2)
         {
            this.mainSkill1.isLearn = 1;
         }
         else
         {
            this.mainSkill1.isLearn = 0;
         }
         this.mainSkillItemFace1 = new ItemFace(this.mainSkill1);
         this.mainSkillItemFace1.showKungFuTag();
         this.mainSkillItemFace1.setShowCount(false);
         this.mainSkillContainer1.addChild(this.mainSkillItemFace1);
      }
   }
}

