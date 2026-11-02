package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.yuxiaojianfa.model.info.YuXiaoJianFaVo;
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
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class YuXiaoJianFa extends Sprite
   {
      
      public static const UI_YUXIAOJIANFA_GUANBI_CLICK:String = "UI_YUXIAOJIANFA_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var yuxiaojianfa:YuXiaoJianFaTupoCanvas;
      
      private var _$parent:DisplayObject;
      
      public const YUXIAOJIANFA_MAX:int = 7;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var tf:TextFormat;
      
      private var Double:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts3:FTextArea;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var p:Point;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkill:Skill;
      
      private var kuang1:Bitmap;
      
      private var chuanchengBo:Boolean = false;
      
      private var fts4:FTextArea;
      
      private var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      public function YuXiaoJianFa()
      {
         var title:FTextArea;
         var fjjn:FTextArea;
         var $mask:Sprite;
         var box:FCanvas = null;
         var ft1:FTextArea = null;
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
         box.skin = "box";
         addChild(box);
         box.x = 2;
         box.y = 231 + 32 - 25;
         box.width = 400;
         box.height = 135 - 32 + 25;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/yuxiaojianfa/bg.swf");
         this.bg.x = 2;
         this.bg.y = 2;
         addChild(this.bg);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 2;
         this.bloodMcSpr.y = 2;
         addChild(this.bloodMcSpr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37;
         this.shangyiyeButton.y = 205 + 25 - 20 + 25;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         this.cengshu.autoSize;
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 170;
         this.cengshu.y = 230 - 20 + 25;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16;
         this.xiayiyeButton.y = 205 + 25 - 20 + 25;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50;
         this.tishengBtn.y = 205 + 25 - 20 + 25;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 110;
         title.x = 24 + 50;
         title.y = 250 + 12 + 18;
         title.textColor = StaticValue.ORANGE;
         title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("玉箫剑法") + "</font></textformat>";
         addChild(title);
         this.miaoshu = new FTextArea();
         this.miaoshu.autoSize;
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.autoSize = TextFieldAutoSize.LEFT;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 230 - 30;
         this.miaoshu.x = 24 - 10;
         this.miaoshu.y = 270 + 12 + 18;
         this.miaoshu.htmlText = "<font   color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("江湖绝技，使用后，可立即解除自身大部分减益状态。纵横江湖，自在逍遥，必备神技。") + "</font>";
         ft1 = new FTextArea();
         ft1.multiline = true;
         ft1.filters = StaticValue.filter;
         ft1.width = 100;
         ft1.height = 110;
         ft1.x = 240;
         ft1.y = 250;
         ft1.textColor = StaticValue.ORANGE;
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 100;
         this.shuxing.height = 110;
         this.shuxing.x = 240 - 14;
         this.shuxing.y = 270 - 15 + 11;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         this.Double = new FTextArea();
         addChild(this.Double);
         this.Double.multiline = true;
         this.Double.autoSize = TextFieldAutoSize.CENTER;
         this.Double.wordWrap = true;
         this.Double.width = 27;
         this.Double.height = 130;
         this.Double.x = 240 + 80 - 14;
         this.Double.y = 270 + 11 + 1;
         fjjn = new FTextArea();
         fjjn.multiline = true;
         fjjn.filters = StaticValue.filter;
         fjjn.width = 100;
         fjjn.height = 110;
         fjjn.x = 205 + 112 - 9 + 36 - 20 + 10;
         fjjn.y = 255 + 5 + 5 + 6 + 22 - 7;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("顶级技能") + "</font></textformat>";
         addChild(fjjn);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 325 - 2 + 33 - 23 + 10;
         this.kuang.y = 300 - 2 + 20 - 7;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 325 + 33 - 23 + 10;
         this.jinengSpr.y = 300 + 20 - 7;
         addChild(this.jinengSpr);
         this.yuxiaojianfa = new YuXiaoJianFaTupoCanvas();
         addChild(this.yuxiaojianfa);
         this.yuxiaojianfa.x = 138;
         this.yuxiaojianfa.y = 0;
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
         this.yuxiaojianfa.mask = $mask;
         addEventListener(UI_YUXIAOJIANFA_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("玉箫剑法顶级属性(已激活)");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("玉箫剑法顶级属性：人物攻击增加10%") + "<br>" + LanResManager.getLanCommonTextWords("攻击8888888 防御 5888888 血量12888888") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("玉箫剑终极激活秘籍(已激活)");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击88888888 防御68888888 血量108888888 暴击 888 闪避888 所有武功提升18层") + "<br></font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 20 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("捆仙术秘籍(已激活)");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("★ 捆仙术 —— 玉虚宫门下，土行孙师傅 俱留孙的一件法宝秘术。不管人、神、魔、妖都可被实实捆住使其毫无挣扎之力。激活") + "<br>" + LanResManager.getLanCommonTextWords("捆仙术的玩家将可锁定任意一个玩家，施发捆仙绳法宝秘术将对手牢牢束缚于原地。且当自身移动到任意位置时，对手也将会被拖") + "<br>" + LanResManager.getLanCommonTextWords("动到该位置效果持续10秒，冷却60秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 + 324;
         this.kuang1.y = 160 + 35 - 186;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 25 + 2 + 324;
         this.mainSkillContainer.y = 160 + 2 + 35 - 186;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7 + 20 + 20 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("御剑术(已激活)");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：80888亿、防御60888亿、血量80888亿、 所有武功提升 600000层") + "<br>" + LanResManager.getLanCommonTextWords("御剑特效：激活御剑术的玩家，可获得剑神的主宰权，人物背后将永久飞行一把灵剑守护持剑者。") + "<br>" + LanResManager.getLanCommonTextWords("御剑术：攻击时100%触发御剑术，持续30秒，在此状态下，自身将驾驭灵剑悬空穿骏，驾驭状") + "<br>" + LanResManager.getLanCommonTextWords("态下，对手将无法锁定，可抵抗一切攻击技能；且自身在驾驭状态下，每攻击对手一次，对手都") + "<br>" + LanResManager.getLanCommonTextWords("将必定命中灵剑束缚、灵剑定身、所有效果失效、瞬间掉血99%、所有攻击操作都将立即停止的") + "<br>" + LanResManager.getLanCommonTextWords("其中任意三个状态，持续5秒。技能冷却60秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 10;
         this.check.y = 28 + 20 + 20 + 20;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = check.x + 20;
            --check.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,15]));
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YUXIAOJIANFA_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YUXIAOJIANFA_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YUXIAOJIANFA_TUPO_CLICK,"",this.lookingId));
               this.showTuPoPanel(true);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.yuxiaojianfa._parent2 = param1;
         this.yuxiaojianfa._parent3 = this;
      }
      
      public function setinitilizeUI(param1:YuXiaoJianFaVo, param2:Boolean) : void
      {
         this.check.selectState = param1.isDanTian;
         this.setBg(param1.nowLookingID);
         this.setShuxingJiacheng(param1.isDouble,param1.miaoshu,param1.act,param1.def,param1.hp,param1.baoji,param1.shanbi);
         this.setZhaoShiMsg(param1.nowLookingName,param1.nowLookingID,param1.nowID);
         this.setSkill(param1.skillid,param1.isLearn);
         this.setJihuo(param2);
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var id:int = param1;
         mcId = id;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/yuxiaojianfa/" + mcId + ".swf";
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
      
      public function setShuxingJiacheng(param1:Boolean, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param2 + "</font>";
         this.shuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成：") + "<br>" + LanResManager.getLanCommonTextWords("攻击:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param4 + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param5 + "<br>" + LanResManager.getLanCommonTextWords("暴击:") + param6 + "<br>" + LanResManager.getLanCommonTextWords("闪避:") + param7 + "</font>";
         if(param1)
         {
            this.Double.visible = true;
         }
         else
         {
            this.Double.visible = false;
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
            if(param2 >= this.YUXIAOJIANFA_MAX)
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
         var _loc4_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc3_:Skill = new Skill(param1);
         if(param2)
         {
            _loc3_.isLearn = 1;
         }
         else
         {
            _loc3_.isLearn = 0;
         }
         _loc4_ = new ItemFace(_loc3_);
         _loc4_.showKungFuTag();
         _loc4_.setShowCount(false);
         this.jinengSpr.addChild(_loc4_);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.yuxiaojianfa.x == 138)
            {
               TweenMax.to(this.yuxiaojianfa,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.yuxiaojianfa.x == 410)
            {
               TweenMax.to(this.yuxiaojianfa,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YUXIAOJIANFA_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.YUXIAOJIANFA_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.yuxiaojianfa.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.yuxiaojianfa.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.yuxiaojianfa.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.yuxiaojianfa.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.yuxiaojianfa.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
      }
      
      public function setJihuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.YUXIAOJIANFA_DINGJI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.YUXIAOJIANFA_ZHONGJIMIJI_ID];
            if(Boolean(GameState.dictMainStatus[SpecialGoodsID.YUXIAOJIANFA_KUNXIANSHU_ID]) || Boolean(GameState.dictMainStatus[SpecialGoodsID.CHUANCHENG_YUXIAOJIANFA_KUNXIANSHU_ID]))
            {
               this.chuanchengBo = true;
            }
            else
            {
               this.chuanchengBo = false;
            }
            this.fts3.visible = this.chuanchengBo;
            if(this.chuanchengBo)
            {
               this.setSkillJiHuo(200244,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.YUXIAOJIANFA_YUJIANSHU_ID])
            {
               this.fts4.visible = true;
               this.check.visible = true;
               this.checkLabel.visible = true;
            }
            else
            {
               this.fts4.visible = false;
               this.check.visible = false;
               this.checkLabel.visible = false;
            }
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.YUXIAOJIANFA_DINGJI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.YUXIAOJIANFA_ZHONGJIMIJI_ID];
            if(Boolean(GameState.dictTargetStatus[SpecialGoodsID.YUXIAOJIANFA_KUNXIANSHU_ID]) || Boolean(GameState.dictTargetStatus[SpecialGoodsID.CHUANCHENG_YUXIAOJIANFA_KUNXIANSHU_ID]))
            {
               this.chuanchengBo = true;
            }
            else
            {
               this.chuanchengBo = false;
            }
            this.fts3.visible = this.chuanchengBo;
            if(this.chuanchengBo)
            {
               this.setSkillJiHuo(200244,true);
               this.mainSkillContainer.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer.visible = false;
               this.kuang1.visible = false;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.YUXIAOJIANFA_YUJIANSHU_ID])
            {
               this.fts4.visible = true;
               this.check.visible = true;
               this.checkLabel.visible = true;
            }
            else
            {
               this.fts4.visible = false;
               this.check.visible = false;
               this.checkLabel.visible = false;
            }
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function setSkillJiHuo(param1:int, param2:Boolean) : void
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
   }
}

