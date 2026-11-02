package com.tgame.shell.view.components.xianmozhilu
{
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ZhongZuJieMian_TianJi extends Sprite
   {
      
      public var _parent:DisplayObject;
      
      private var boxContainer:Sprite;
      
      private var gongji:FLabel;
      
      private var fangyu:FLabel;
      
      private var shengming:FLabel;
      
      private var shuXing:FLabel;
      
      private var xiaohao:FLabel;
      
      private var beibao:FLabel;
      
      private var txtTip:FLabel;
      
      private var btnShengJie:NewSkinButton;
      
      private var txtXianMoJueXingJi:FTextArea;
      
      private var itemSpr0:Sprite;
      
      private var itemSpr1:Sprite;
      
      private var itemSpr2:Sprite;
      
      private var itemSpr3:Sprite;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var arrStar:Array;
      
      private var itemContainer:Sprite;
      
      private var heroHeadMC:MovieClip;
      
      private var heroEffectMC:MovieClip;
      
      public function ZhongZuJieMian_TianJi()
      {
         var bg:DisplayObject;
         var bg1:DisplayObject;
         super();
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/tianji/bg.swf");
         bg.x = 10;
         bg.y = 22;
         addChild(bg);
         bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/tianji/zi.swf");
         bg1.x = 35;
         bg1.y = 197;
         addChild(bg1);
         this.boxContainer = new Sprite();
         addChild(this.boxContainer);
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
         this.itemSpr0 = new Sprite();
         this.itemContainer.addChild(this.itemSpr0);
         ToolTips.createToolTips(this.itemSpr0,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "第一层技能：唤潮之佑或法尊守护（仙魔两个技能）施发技能后范围内所有对手瞬间流" + "<br>" + "失总血量5%。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.itemSpr1 = new Sprite();
         this.itemContainer.addChild(this.itemSpr1);
         ToolTips.createToolTips(this.itemSpr1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "第二层技能：清风拂尘或剑域锁（仙魔两个技能）施发技能后使对手瞬间流失总血量5%。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.itemSpr2 = new Sprite();
         this.itemContainer.addChild(this.itemSpr2);
         ToolTips.createToolTips(this.itemSpr2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "第三层技能：天凤神炎或神龙摆尾（仙魔两个技能）施发技能后使对手瞬间流失总血量1%。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.itemSpr3 = new Sprite();
         this.itemContainer.addChild(this.itemSpr3);
         ToolTips.createToolTips(this.itemSpr3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "第四层技能：隐龙刀或追魂斩（仙魔两个技能）施发技能后使对手瞬间流失总血量1%。" + "<br>" + "每层提升属性固定的，攻击：5000000亿 防御：5000000亿 血量：10000000亿" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.initStar();
         this.gongji = new FLabel();
         this.gongji.textColor = StaticValue.YELLOW;
         this.gongji.filters = StaticValue.filter;
         this.gongji.x = 70;
         this.gongji.y = 235;
         addChild(this.gongji);
         this.fangyu = new FLabel();
         this.fangyu.textColor = StaticValue.YELLOW;
         this.fangyu.filters = StaticValue.filter;
         this.fangyu.x = 200;
         this.fangyu.y = 235;
         addChild(this.fangyu);
         this.shengming = new FLabel();
         this.shengming.textColor = StaticValue.YELLOW;
         this.shengming.filters = StaticValue.filter;
         this.shengming.x = 330;
         this.shengming.y = 235;
         addChild(this.shengming);
         this.shuXing = new FLabel();
         this.shuXing.textColor = StaticValue.YELLOW;
         this.shuXing.filters = StaticValue.filter;
         this.shuXing.x = 290;
         this.shuXing.y = 250;
         addChild(this.shuXing);
         this.xiaohao = new FLabel();
         this.xiaohao.textColor = StaticValue.YELLOW;
         this.xiaohao.filters = StaticValue.filter;
         this.xiaohao.x = 235;
         this.xiaohao.y = 322;
         addChild(this.xiaohao);
         this.beibao = new FLabel();
         this.beibao.textColor = StaticValue.YELLOW;
         this.beibao.filters = StaticValue.filter;
         this.beibao.x = 235;
         this.beibao.y = 342;
         addChild(this.beibao);
         this.txtTip = new FLabel();
         this.txtTip.textColor = StaticValue.RED;
         this.txtTip.filters = StaticValue.filter;
         this.txtTip.text = "玩法说明";
         this.txtTip.x = 370;
         this.txtTip.y = 30;
         addChild(this.txtTip);
         ToolTips.createToolTips(this.txtTip,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "玩法说明：激活天技的玩家可以消耗天灵为系统升级，当星" + "<br>" + "数满足激活条件时会激活天技效果，为仙魔技能加强攻击效" + "<br>" + "果。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.btnShengJie = new NewSkinButton();
         this.btnShengJie.skin = "xianmotianji_Button";
         this.btnShengJie.x = 145;
         this.btnShengJie.y = 360;
         addChild(this.btnShengJie);
         this.btnShengJie.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.txtXianMoJueXingJi = new FTextArea();
         this.txtXianMoJueXingJi.x = 30;
         this.txtXianMoJueXingJi.y = 45;
         this.txtXianMoJueXingJi.textColor = StaticValue.GREEN;
         this.txtXianMoJueXingJi.width = 70;
         this.txtXianMoJueXingJi.height = 20;
         this.txtXianMoJueXingJi.htmlText = "仙魔觉醒技";
         this.txtXianMoJueXingJi.visible = false;
         addChild(this.txtXianMoJueXingJi);
         ToolTips.createToolTips(this.txtXianMoJueXingJi,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：仙魔满级时自身觉醒属性获得翻倍效果；" + "<br>" + "特殊技能：战斗状态下100%反噬对手一个仙魔觉醒技，对手每次操作都将会掉落1%当前血" + "<br>" + "量，且在此期间内无法恢复血量，持续15秒，冷却90秒。" + "（对仙魔转生及非转生均有效！）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft1 = new FTextArea();
         this.ft1.x = 15;
         this.ft1.y = 30;
         this.ft1.textColor = StaticValue.GREEN;
         this.ft1.filters = Tools.borderFilter;
         this.ft1.width = 70;
         this.ft1.height = 20;
         this.ft1.htmlText = "天技觉醒石";
         this.ft1.visible = false;
         addChild(this.ft1);
         ToolTips.createToolTips(this.ft1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：激活后增加人物全属性2000%" + "<br>" + "特殊属性：攻击1000888亿、防御800888亿、血量800888亿、所有武功提升1000000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft2 = new FTextArea();
         this.ft2.x = 15;
         this.ft2.y = 48;
         this.ft2.textColor = StaticValue.GREEN;
         this.ft2.filters = Tools.borderFilter;
         this.ft2.width = 70;
         this.ft2.height = 20;
         this.ft2.htmlText = "天技属性石 ";
         this.ft2.visible = false;
         addChild(this.ft2);
         ToolTips.createToolTips(this.ft2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：激活后增加人物全属性.300%" + "<br>" + "特殊属性：攻击1000888亿、防御800888亿、血量800888亿、所有武功提升1000000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ft3 = new FTextArea();
         this.ft3.x = 15;
         this.ft3.y = 64;
         this.ft3.textColor = StaticValue.GREEN;
         this.ft3.filters = Tools.borderFilter;
         this.ft3.width = 70;
         this.ft3.height = 20;
         this.ft3.htmlText = "天技觉醒技";
         this.ft3.visible = false;
         addChild(this.ft3);
         ToolTips.createToolTips(this.ft3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊技能：战斗时100%触发天技觉醒，持续15秒；自身在此状态下，全身武学受到天技限制无法使用；" + "<br>" + "且天技效果下的对手，只要触发任何技能效果，都将会导致技能反噬，瞬间失去70%的生命，且反噬期间，" + "<br>" + "对手只要受到攻击都将会立即被定在原地无法移动，每次移动必定被拉回；且自身的攻击将具有破除无敌" + "<br>" + "效果，每次攻击都将无视对手的防御阻挡，每次命中成功都将会产生天技光环保护自身不受到伤害。冷却" + "<br>" + "60秒。" + "<br>" + "天技觉醒石：激活天技觉醒石可将天技的技能持续时间翻倍，冷却时间缩短一半。" + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new Event(ZhongZuJieMianPanel.UI_XIANMOTIANJI_SHENGJIE));
      }
      
      private function initStar() : void
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:DisplayObject = null;
         this.arrStar = new Array();
         var _loc1_:int = 0;
         while(_loc1_ < 4)
         {
            _loc3_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/tianji/" + (_loc1_ + 1) + ".swf");
            this["itemSpr" + _loc1_].addChild(_loc3_);
            this["itemSpr" + _loc1_].x = 55 + _loc1_ * 90;
            this["itemSpr" + _loc1_].y = 95;
            this["itemSpr" + _loc1_].name = _loc1_ + "";
            this["itemSpr" + _loc1_].filters = Tools.blackWhiteFilter;
            _loc1_++;
         }
         var _loc2_:int = 0;
         while(_loc2_ < 12)
         {
            _loc4_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/juexing/an.swf");
            _loc4_.x = _loc2_ * 21 + 100;
            _loc4_.y = 290;
            addChild(_loc4_);
            _loc5_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/juexing/liang.swf");
            _loc5_.x = _loc4_.x;
            _loc5_.y = _loc4_.y;
            addChild(_loc5_);
            this.arrStar.push(_loc5_);
            _loc2_++;
         }
      }
      
      public function setXianMoJueXingData(param1:Object) : void
      {
         var _loc4_:DisplayObject = null;
         this.removeItemBoxChildren();
         var _loc2_:int = 0;
         while(_loc2_ < 12)
         {
            if(_loc2_ < param1.star)
            {
               this.arrStar[_loc2_].visible = true;
            }
            else
            {
               this.arrStar[_loc2_].visible = false;
            }
            _loc2_++;
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1.rank)
         {
            _loc4_ = this.itemContainer.getChildByName(_loc3_ + "") as DisplayObject;
            _loc4_.filters = [];
            _loc3_++;
         }
         this.gongji.text = param1.gongji + "亿";
         this.fangyu.text = param1.fangyu + "亿";
         this.shengming.text = param1.shengming + "亿";
         this.xiaohao.text = param1.xiaohao + "";
         this.setGoodsChangeHandler();
         this.ft1.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_TIANJIJUEXINGSHI];
         this.ft2.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_TIANJISHUXINGSHI];
         this.ft3.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_TIANJIJUEXINGJI];
      }
      
      public function setGoodsChangeHandler() : void
      {
         this.beibao.text = String(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(47256,true));
      }
      
      private function removeItemBoxChildren() : void
      {
         while(this.boxContainer.numChildren > 0)
         {
            this.boxContainer.removeChildAt(0);
         }
      }
   }
}

