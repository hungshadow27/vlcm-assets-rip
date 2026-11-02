package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
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
   import com.tgame.moudels.xuantiejianfa.model.info.XuanTieJianFaVO;
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
   
   public class XuanTieJianFa extends Sprite
   {
      
      public static const UI_XUANTIEJIANFA_GUANBI_CLICK:String = "UI_XUANTIEJIANFA_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var xuantiejianfa:XuanTieJianFaTupoCanvas;
      
      private var _$parent:DisplayObject;
      
      public const XUANTIEJIANFA_MAX:int = 9;
      
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
      
      private var fts3:FTextArea;
      
      private var equipContainers:Sprite;
      
      private var isMain:Boolean;
      
      private var fujia:FTextArea;
      
      private var kuangHD:Bitmap;
      
      private var kuangSpr:Sprite;
      
      public function XuanTieJianFa()
      {
         var title:FTextArea;
         var fjjn:FTextArea;
         var $mask:Sprite;
         var i:int;
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
         title.y = 240;
         title.textColor = StaticValue.ORANGE;
         title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("玄铁剑法") + "</font></textformat>";
         addChild(title);
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 160;
         this.miaoshu.height = 110 + 20;
         this.miaoshu.x = 30;
         this.miaoshu.y = 260;
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
         fjjn.y = 255 + 5 + 5 + 6 + 22;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("附加技能") + "</font></textformat>";
         addChild(fjjn);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 325 - 2 + 33;
         this.kuang.y = 300 - 2 + 20;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 325 + 33;
         this.jinengSpr.y = 300 + 20;
         addChild(this.jinengSpr);
         this.xuantiejianfa = new XuanTieJianFaTupoCanvas();
         addChild(this.xuantiejianfa);
         this.xuantiejianfa.x = 138;
         this.xuantiejianfa.y = 0;
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
         this.xuantiejianfa.mask = $mask;
         addEventListener(UI_XUANTIEJIANFA_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170 + 20;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("玄铁剑法专属称号秘籍（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：15888亿、防御12888亿、血量16888亿、所有武功提升 180000层") + "<br>" + LanResManager.getLanCommonTextWords("★将可以获得该系统的专属称号！【我要打十个】") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10 + 288;
         this.fts3.y = 7;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170 + 20 + 20;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("战国元帅（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：16888亿、防御12888亿、血量10888亿、所有武功提升 120000层") + "<br>" + LanResManager.getLanCommonTextWords("战国元帅（特殊技能）：攻击时有几率触发战国元帅附体效果，持续10秒。自身受元帅庇护全身周围") + "<br>" + LanResManager.getLanCommonTextWords("产生战神光环，可随人物移动。自身在此状态下每次攻击对手都可将对手拉至身旁眩晕2秒，且光环") + "<br>" + LanResManager.getLanCommonTextWords("周围五格内所有玩家每秒掉血60%。自身在光环下每3秒将产生一次无敌状态，持续3秒！");
            return _loc1_ + "</textformat>";
         });
         this.kuangSpr = new Sprite();
         addChild(this.kuangSpr);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 295 - 288;
         this.equipContainers.y = 322 - 73 + 1 - 85;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         addChild(this.equipContainers);
         i = 0;
         while(i < 4)
         {
            this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.kuangSpr.addChild(this.kuangHD);
            this.kuangHD.x = 10 + 40 * i;
            this.kuangHD.y = 266 - 2 - 1 - 10 - 85;
            i++;
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XUANTIEJIANFA_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XUANTIEJIANFA_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XUANTIEJIANFA_TUPO_CLICK,"",this.lookingId));
               this.showTuPoPanel(true);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.xuantiejianfa._parent2 = param1;
         this.xuantiejianfa._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:XuanTieJianFaVO) : void
      {
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.miaoshu,param2.act,param2.def,param2.hp,param2.neili,param2.tili);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skillid,param2.isLearn);
         this.setJiHuo(param1);
         this.isMain = param1;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.XUANTIEJIANFA_ZHUANSHU_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.XUANTIEZHONGJIAN_ZHANGUOYUANSHUAI_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.XUANTIEJIANFA_ZHUANSHU_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.XUANTIEZHONGJIAN_ZHANGUOYUANSHUAI_ID];
         }
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var id:int = param1;
         mcId = id;
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/xuantiejianfa/" + mcId + ".swf";
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
         this.shuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成：") + "<br>" + LanResManager.getLanCommonTextWords("攻击:") + param2 + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param4 + "<br>" + LanResManager.getLanCommonTextWords("内力:") + param5 + "<br>" + LanResManager.getLanCommonTextWords("体力:") + param6 + "</font>";
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
            if(param2 >= this.XUANTIEJIANFA_MAX)
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
            if(this.xuantiejianfa.x == 138)
            {
               TweenMax.to(this.xuantiejianfa,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.xuantiejianfa.x == 410)
            {
               TweenMax.to(this.xuantiejianfa,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XUANTIEJIANFA_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.XUANTIEJIANFA_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.xuantiejianfa.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.xuantiejianfa.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.xuantiejianfa.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.xuantiejianfa.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.xuantiejianfa.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_XuanTieJianFa(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_XUANTIEJIANFA_QIAN)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_XUANTIEJIANFA_ZHONG)
            {
               _loc4_.x = 40 + 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_XUANTIEJIANFA_HOU)
            {
               _loc4_.x = 40 + 4 + 1 + 40;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_XUANTIEJIANFA_HUFA)
            {
               _loc4_.x = 40 + 4 + 1 + 80;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

