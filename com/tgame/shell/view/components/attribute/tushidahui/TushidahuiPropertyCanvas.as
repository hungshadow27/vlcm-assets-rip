package com.tgame.shell.view.components.attribute.tushidahui
{
   import com.fireice.text.FLabel;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.moudels.tushidahui.view.info.TushidahuiVO;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class TushidahuiPropertyCanvas extends Sprite
   {
      
      private var _textList:Vector.<FLabel>;
      
      private var _barList:Vector.<ColorBar>;
      
      private var _vo:TushidahuiVO;
      
      public function TushidahuiPropertyCanvas()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         var _loc2_:FLabel = null;
         var _loc3_:FLabel = null;
         var _loc4_:FLabel = null;
         var _loc5_:Bitmap = null;
         var _loc6_:ColorBar = null;
         var _loc1_:Array = [LanResManager.getLanCommonTextWords("攻 击 力"),LanResManager.getLanCommonTextWords("防 御 力"),LanResManager.getLanCommonTextWords("生 命 力"),LanResManager.getLanCommonTextWords("武功层数")];
         this._textList = new Vector.<FLabel>();
         this._barList = new Vector.<ColorBar>();
         var _loc7_:uint = 0;
         while(_loc7_ < 5)
         {
            _loc2_ = new FLabel();
            addChild(_loc2_);
            _loc2_.filters = StaticValue.filter;
            _loc2_.textColor = StaticValue.ORANGE;
            _loc4_ = new FLabel();
            addChild(_loc4_);
            _loc4_.filters = StaticValue.filter;
            _loc4_.textColor = StaticValue.ORANGE;
            if(_loc7_ == 4)
            {
               _loc2_.text = LanResManager.getLanCommonTextWords("传奇总属性");
               _loc2_.x = 20;
               _loc4_.text = LanResManager.getLanCommonTextWords("属性提升");
               _loc4_.x = 160;
            }
            else
            {
               _loc2_.text = String(_loc1_[_loc7_]);
               _loc2_.y = 18 * (_loc7_ + 1);
               _loc3_ = new FLabel();
               addChild(_loc3_);
               _loc3_.filters = StaticValue.filter;
               _loc3_.textColor = StaticValue.WHITE;
               _loc3_.x = _loc2_.x + 55;
               _loc3_.y = _loc2_.y;
               _loc4_.text = String(_loc1_[_loc7_]);
               _loc4_.x = 130;
               _loc4_.y = 18 * (_loc7_ + 1);
               _loc5_ = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
               addChild(_loc5_);
               _loc5_.x = _loc4_.x + 55;
               _loc5_.y = 19 * (_loc7_ + 1);
               _loc6_ = new ColorBar(5,123,5);
               addChild(_loc6_);
               _loc6_.setValue(10000,100000);
               _loc6_.x = _loc5_.x + 4;
               _loc6_.y = _loc5_.y + 3;
               this._textList.push(_loc3_);
               this._barList.push(_loc6_);
            }
            _loc7_++;
         }
      }
      
      public function set vo(param1:TushidahuiVO) : void
      {
         this._vo = param1;
         this._textList[0].text = this._vo.actTotal.toString();
         this._textList[1].text = this._vo.defTotal.toString();
         this._textList[2].text = this._vo.hpTotal.toString();
         this._textList[3].textColor = StaticValue.ORANGE;
         this._textList[3].text = this._vo.lvTotal.toString() + LanResManager.getLanCommonTextWords("层");
         this._barList[0].setValue(this._vo.act,this._vo.actMax);
         this._barList[1].setValue(this._vo.def,this._vo.defMax);
         this._barList[2].setValue(this._vo.hp,this._vo.hpMax);
         this._barList[3].setValue(this._vo.lv,this._vo.lvMax);
      }
      
      public function setVo(param1:Boolean, param2:TushidahuiVO) : void
      {
         this._vo = param2;
         if(param1)
         {
            this._textList[0].text = this._vo.actTotal.toString() + (GameState.dictMainStatus[SpecialGoodsID.SHIWANGCHUANQI_FANBEI_ID] ? " X 2" : "");
            this._textList[1].text = this._vo.defTotal.toString() + (GameState.dictMainStatus[SpecialGoodsID.SHIWANGCHUANQI_FANBEI_ID] ? " X 2" : "");
            this._textList[2].text = this._vo.hpTotal.toString() + (GameState.dictMainStatus[SpecialGoodsID.SHIWANGCHUANQI_FANBEI_ID] ? " X 2" : "");
            this._textList[3].textColor = StaticValue.ORANGE;
            this._textList[3].text = this._vo.lvTotal.toString() + LanResManager.getLanCommonTextWords("层") + (GameState.dictMainStatus[SpecialGoodsID.SHIWANGCHUANQI_FANBEI_ID] ? " X 2" : "");
         }
         else
         {
            this._textList[0].text = this._vo.actTotal.toString() + (GameState.dictTargetStatus[SpecialGoodsID.SHIWANGCHUANQI_FANBEI_ID] ? " X 2" : "");
            this._textList[1].text = this._vo.defTotal.toString() + (GameState.dictTargetStatus[SpecialGoodsID.SHIWANGCHUANQI_FANBEI_ID] ? " X 2" : "");
            this._textList[2].text = this._vo.hpTotal.toString() + (GameState.dictTargetStatus[SpecialGoodsID.SHIWANGCHUANQI_FANBEI_ID] ? " X 2" : "");
            this._textList[3].textColor = StaticValue.ORANGE;
            this._textList[3].text = this._vo.lvTotal.toString() + LanResManager.getLanCommonTextWords("层") + (GameState.dictTargetStatus[SpecialGoodsID.SHIWANGCHUANQI_FANBEI_ID] ? " X 2" : "");
         }
         this._barList[0].setValue(this._vo.act,this._vo.actMax);
         this._barList[1].setValue(this._vo.def,this._vo.defMax);
         this._barList[2].setValue(this._vo.hp,this._vo.hpMax);
         this._barList[3].setValue(this._vo.lv,this._vo.lvMax);
      }
   }
}

