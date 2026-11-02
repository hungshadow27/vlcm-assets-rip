package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.lingxiyizhi.model.info.LingXiYiZhiVo;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class LingXiYiZhi extends Sprite
   {
      
      public static const UI_LINGXIYIZHI_GUANBI_CLICK:String = "UI_LINGXIYIZHI_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var lingxiyizhi:LingXiYiZhiTupoCanvas;
      
      private var _$parent:DisplayObject;
      
      private var bg1:DisplayObject;
      
      public const LINGXIYIZHI_MAX:int = 6;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var tf:TextFormat;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var checkWq:FCheckBox;
      
      private var fts3:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var fts4:FTextArea;
      
      private var suipian:int = 0;
      
      private var checkCb:FCheckBox;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMain:Boolean;
      
      public function LingXiYiZhi()
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
         box.skin = "box";
         addChild(box);
         box.x = 2;
         box.y = 231 + 32 - 25 - 2;
         box.width = 400;
         box.height = 135 - 32 + 25 + 2;
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 2;
         this.bloodMcSpr.y = 2;
         addChild(this.bloodMcSpr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37;
         this.shangyiyeButton.y = 205 + 25 - 20 + 25 - 10 - 17;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 170;
         this.cengshu.y = 230 - 20 + 25 - 10 - 17;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16;
         this.xiayiyeButton.y = 205 + 25 - 20 + 25 - 10 - 17;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50;
         this.tishengBtn.y = 205 + 25 - 20 + 25 - 10 - 17;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 110;
         title.x = 70;
         title.y = 240 + 10;
         title.textColor = StaticValue.ORANGE;
         title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("灵犀一指") + "</font></textformat>";
         addChild(title);
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 160 + 30;
         this.miaoshu.height = 110 + 20;
         this.miaoshu.x = 30 - 15;
         this.miaoshu.y = 260 + 20;
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("江湖绝技，使用后，可立即解除自身大部分减益状态。纵横江湖，自在逍遥，必备神技。") + "</font>";
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 100 + 100;
         this.shuxing.height = 110;
         this.shuxing.x = 210 + 13;
         this.shuxing.y = 250 - 3 - 25 + 30;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         fjjn = new FTextArea();
         fjjn.multiline = true;
         fjjn.filters = StaticValue.filter;
         fjjn.width = 100;
         fjjn.height = 110;
         fjjn.x = 205 + 112 - 9 + 36;
         fjjn.y = 255 + 5 + 5 + 6 + 22 - 45;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("附加技能") + "</font></textformat>";
         addChild(fjjn);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 325 - 2 + 33;
         this.kuang.y = 300 - 2 + 20;
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 325 - 2 + 33;
         this.kuang.y = 300 - 2 + 20 - 45;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 325 + 33;
         this.jinengSpr.y = 300 + 20;
         addChild(this.jinengSpr);
         this.lingxiyizhi = new LingXiYiZhiTupoCanvas();
         addChild(this.lingxiyizhi);
         this.lingxiyizhi.x = 138;
         this.lingxiyizhi.y = 0;
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
         this.lingxiyizhi.mask = $mask;
         addEventListener(UI_LINGXIYIZHI_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("天神之翼幻化秘籍（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击时100%触发天神之翼幻化和灵化合二为一，持续10秒；可瞬间清除自身的") + "<br>" + LanResManager.getLanCommonTextWords("所有负面状态，且自身元神出窍，飞出身外，留下假身在原地；且在元神出窍") + "<br>" + LanResManager.getLanCommonTextWords("的状态下，只要攻击任何对手，对手的灵魂都将被打出，使其魂不归体，呆滞") + "<br>" + LanResManager.getLanCommonTextWords("原地10秒，不可清除。冷却90秒。");
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7 + 25;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 80;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("血舞旋月");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("血舞旋月：刀刃经过处会生成血蝴蝶。") + "<br>" + LanResManager.getLanCommonTextWords("血舞金轮：攻击时100%触发血舞金轮，持续10秒；对手在此状态下，被血色舞蝶缠绕，") + "<br>" + LanResManager.getLanCommonTextWords("流血不止，每秒掉血50%（不可清除）。持续10秒；且流血状态下，经脉暴走失行动能") + "<br>" + LanResManager.getLanCommonTextWords("力，无法攻击；状态消失后，对手元气大伤，勋章技能失效，形同虚无，持续10秒。") + "<br>" + LanResManager.getLanCommonTextWords("冷却60秒。");
            return _loc1_ + "</textformat>";
         });
         this.checkWq = new FCheckBox();
         addChild(this.checkWq);
         this.checkWq.visible = false;
         this.checkWq.x = 80;
         this.checkWq.y = 7 + 25;
         this.checkWq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 25 + 25;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 80;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("玄冰苍穹");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击10888888889000 防御8888888889000 血量12888888889000") + "<br>" + LanResManager.getLanCommonTextWords("暴击88888闪避88888 所有武功2800000层") + "<br>" + LanResManager.getLanCommonTextWords("玄冰苍穹：攻击时100%触发苍穹之击，持续15秒；对手在此状态下，将受到玄冰苍穹的") + "<br>" + LanResManager.getLanCommonTextWords("威慑所有攻击行动都将进入停滞模式，对手的攻击速度和移动速度下降至0点；且所有勋") + "<br>" + LanResManager.getLanCommonTextWords("章都将被玄冰冻结无法触发，持续10秒；当冻结解除后，对手将受到寒气侵蚀，每次攻") + "<br>" + LanResManager.getLanCommonTextWords("击都能造成80%血量伤害，持续5秒。冷却60秒");
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 80;
         this.checkZq.y = 7 + 25 + 25;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7 + 25 + 25 + 25;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 80;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("天神之翼");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("羽翼灵化：攻击时有几率触发羽翼灵化，持续10秒；羽翼幻化成最大化，将范围5格内") + "<br>" + LanResManager.getLanCommonTextWords("的所有对手包裹在羽翼之内，若十秒内无法逃脱，可瞬间秒杀所有对手的重命值，使对") + "<br>" + LanResManager.getLanCommonTextWords("手的生命值剩1点。") + "<br>" + LanResManager.getLanCommonTextWords("天神之翼属性：激活天神之翼后，将开启天神之翼隐藏属性，可使用天界碎片对该隐藏") + "<br>" + LanResManager.getLanCommonTextWords("属性进行养成（最多可养成200次）。每个增加：攻击1500亿，所有武功350000层") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用") + " " + suipian + " " + LanResManager.getLanCommonTextWords("个天界碎片") + "<br>" + "Võ Công " + suipian * 50000 + " Tầng, Võ Phòng " + suipian * 50000 + " Tầng";
            return _loc1_ + "</textformat>";
         });
         this.checkCb = new FCheckBox();
         addChild(this.checkCb);
         this.checkCb.x = 80;
         this.checkCb.y = 7 + 25 + 25 + 25;
         this.checkCb.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343 + 8 - 250;
         this.equipContainers.y = 12 + 30 + 135 - 150;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         addChild(this.equipContainers);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkWq:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq.selectState,100]));
               break;
            case this.checkZq:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,101]));
               break;
            case this.checkCb:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkCb.selectState,103]));
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LINGXIYIZHI_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LINGXIYIZHI_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LINGXIYIZHI_TUPO_CLICK,"",this.lookingId));
               this.showTuPoPanel(true);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.lingxiyizhi._parent2 = param1;
         this.lingxiyizhi._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:LingXiYiZhiVo) : void
      {
         this.isMain = param1;
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.miaoshu,param2.act,param2.def,param2.hp,param2.baoji,param2.shanbi);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skillid,param2.skillid2,param2.isLearn);
         this.setJiHuo(param1);
         this.checkZq.selectState = param2.isZuoQI;
         this.checkWq.selectState = param2.isWuQI;
         this.checkCb.selectState = param2.isChiBang;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.LINGXIYIZHI_HUANHUAMIJI_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.LINGXIYIZHI_XUANBINGCANGQIONG_ID];
            this.checkZq.visible = GameState.dictMainStatus[SpecialGoodsID.LINGXIYIZHI_XUANBINGCANGQIONG_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.LINGXIYIZHI_TIANSHENZHIYI_ID];
            this.suipian = GameState.dictMainStatus[SpecialGoodsID.LINGXIYIZHI_TIANJIESUIPIAN_ID];
            this.checkCb.visible = GameState.dictMainStatus[SpecialGoodsID.LINGXIYIZHI_TIANSHENZHIYI_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.LINGXIYIZHI_HUANHUAMIJI_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.LINGXIYIZHI_XUANBINGCANGQIONG_ID];
            this.checkZq.visible = GameState.dictTargetStatus[SpecialGoodsID.LINGXIYIZHI_XUANBINGCANGQIONG_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.LINGXIYIZHI_TIANSHENZHIYI_ID];
            this.suipian = GameState.dictTargetStatus[SpecialGoodsID.LINGXIYIZHI_TIANJIESUIPIAN_ID];
            this.checkCb.visible = GameState.dictTargetStatus[SpecialGoodsID.LINGXIYIZHI_TIANSHENZHIYI_ID];
         }
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var lookId:int = param1;
         mcId = lookId;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/lingxiyizhi/" + mcId + ".swf";
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
      
      public function setShuxingJiacheng(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.miaoshu.htmlText = "<font  color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "</font>";
         this.shuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成：") + "<br>" + LanResManager.getLanCommonTextWords("攻击:") + param2 + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param4 + "<br>" + LanResManager.getLanCommonTextWords("暴击:") + param5 + "<br>" + LanResManager.getLanCommonTextWords("闪避:") + param6 + "</font>";
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
            if(param2 >= this.LINGXIYIZHI_MAX)
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
      
      public function setSkill(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc5_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc4_:Skill = new Skill(param1);
         if(param3)
         {
            _loc4_.isLearn = 1;
         }
         else
         {
            _loc4_.isLearn = 0;
         }
         _loc5_ = new ItemFace(_loc4_);
         _loc5_.y = -45;
         _loc5_.showKungFuTag();
         _loc5_.setShowCount(false);
         this.jinengSpr.addChild(_loc5_);
         var _loc6_:Skill = new Skill(param2);
         if(param3)
         {
            _loc6_.isLearn = 1;
         }
         else
         {
            _loc6_.isLearn = 0;
         }
         _loc5_ = new ItemFace(_loc6_);
         _loc5_.showKungFuTag();
         _loc5_.setShowCount(false);
         this.jinengSpr.addChild(_loc5_);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.lingxiyizhi.x == 138)
            {
               TweenMax.to(this.lingxiyizhi,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.lingxiyizhi.x == 410)
            {
               TweenMax.to(this.lingxiyizhi,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LINGXIYIZHI_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.LINGXIYIZHI_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.lingxiyizhi.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.lingxiyizhi.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.lingxiyizhi.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.lingxiyizhi.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.lingxiyizhi.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_LingXiYiZhi(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_LINGXIYIZHI_XUEWU)
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               this.kuangHD.x = 0;
               this.kuangHD.y = 0;
               _loc4_.x = 2;
               _loc4_.y = 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq.visible = true;
                  this.fts2.visible = true;
               }
               else
               {
                  this.checkWq.visible = false;
                  this.fts2.visible = false;
               }
            }
            _loc2_++;
         }
      }
   }
}

