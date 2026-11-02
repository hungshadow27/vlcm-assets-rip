package com.tgame.moudels.common.auto
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.vo.character.info.GoodsInfo;
   import com.tgame.common.vo.character.info.MoneyInfo;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.Item.model.vo.FindGoodsVO;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class AutoMediator extends Mediator
   {
      
      private static var $findIndex:int = 0;
      
      protected static const Ready:int = 0;
      
      protected static const Finding:int = 1;
      
      protected static const Buying:int = 2;
      
      protected var _state:int = 0;
      
      private var _findId:int = 0;
      
      protected var isAutoBuy:Boolean = false;
      
      private var _goods:Object = new Object();
      
      private var _goods_needBuy:Array = new Array();
      
      protected var upgradeFun:Function;
      
      protected var upgradeData:Array = null;
      
      public function AutoMediator(param1:String = null, param2:Object = null)
      {
         super(param1,param2);
      }
      
      private static function get FindIndex() : int
      {
         if($findIndex >= 999999)
         {
            $findIndex = 0;
         }
         ++$findIndex;
         return $findIndex;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [PipeConstants.GOODS_CHANGED,PipeConstants.BUY_GOOD_SUCCESS];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         if(!_loc2_)
         {
            return;
         }
         switch(param1.getName())
         {
            case PipeConstants.GOODS_CHANGED:
               if(_loc2_.key == this._findId)
               {
                  switch(this._state)
                  {
                     case Finding:
                        this.startBuy(_loc2_);
                        break;
                     case Buying:
                        this.try2Upgrade(_loc2_);
                  }
               }
               break;
            case PipeConstants.BUY_GOOD_SUCCESS:
               if(this._state == Buying)
               {
                  this.buyHandler(_loc2_);
               }
         }
      }
      
      protected function buyAndUpgrade() : void
      {
         if(this.state != Ready)
         {
            return;
         }
         if(this.isFull)
         {
            FAlert.show(LanResManager.getLanCommonTextWords("您的包裹空间不足，无法自动购买道具。"));
            this.stopAutoUpgrade();
            return;
         }
         this._state = Finding;
         if(this.numGoods)
         {
            this.find();
         }
         else
         {
            this.upgrade();
         }
      }
      
      private function startBuy(param1:Object) : void
      {
         var _loc2_:Array = this.findNeedBuyGoods(param1);
         if(_loc2_.length)
         {
            this.try2Buy(_loc2_);
         }
         else
         {
            this.upgrade();
         }
      }
      
      protected function try2Buy(param1:Array) : Boolean
      {
         var _loc5_:FindGoodsVO = null;
         var _loc6_:FindGoodsVO = null;
         var _loc7_:Array = null;
         var _loc2_:MoneyInfo = GameInstance.mainCharData.moneyInfo;
         var _loc3_:int = _loc2_.gold;
         var _loc4_:int = 0;
         for each(_loc5_ in param1)
         {
            _loc4_ += _loc5_.price * _loc5_.num;
         }
         if(_loc4_ > _loc3_)
         {
            this.alert2Chongzhi();
            this.clearAuto();
            this.stopAutoUpgrade();
            return false;
         }
         for each(_loc6_ in param1)
         {
            _loc7_ = [_loc6_.shopId,_loc6_.num];
            PipeManager.sendMsg(PipeConstants.BUY_GOOD,_loc7_);
         }
         this._state = Buying;
         return true;
      }
      
      private function buyHandler(param1:Object) : void
      {
         var _loc4_:FindGoodsVO = null;
         var _loc2_:int = int(param1);
         var _loc3_:Boolean = false;
         for each(_loc4_ in this._goods)
         {
            if(_loc4_.shopId == _loc2_)
            {
               _loc3_ = true;
               break;
            }
         }
         if(_loc3_)
         {
            this.find();
         }
      }
      
      private function try2Upgrade(param1:Object) : void
      {
         var _loc2_:Array = this.findNeedBuyGoods(param1);
         if(!_loc2_.length)
         {
            this.upgrade();
         }
      }
      
      private function upgrade() : void
      {
         this.upgradeFun.apply(null,this.upgradeData);
         this.clearAuto();
      }
      
      private function find() : void
      {
         var _loc2_:FindGoodsVO = null;
         var _loc3_:Object = null;
         var _loc1_:Array = new Array();
         for each(_loc2_ in this._goods)
         {
            _loc1_.push(_loc2_.goodId);
         }
         this._findId = FindIndex;
         _loc3_ = new Object();
         _loc3_.key = this._findId;
         _loc3_.arr = _loc1_;
         PipeManager.sendMsg(PipeConstants.FIND_BAGGOODS,_loc3_);
      }
      
      protected function addGood(param1:int, param2:int, param3:int = 0) : void
      {
         var _loc4_:FindGoodsVO = new FindGoodsVO(param1,param2,param3);
         this._goods[param1] = _loc4_;
      }
      
      protected function removeGood(param1:int) : void
      {
         if(this._goods.hasOwnProperty(param1))
         {
            delete this._goods[param1];
         }
      }
      
      private function findNeedBuyGoods(param1:Object) : Array
      {
         var _loc4_:FindGoodsVO = null;
         var _loc5_:FindGoodsVO = null;
         var _loc6_:int = 0;
         var _loc7_:FindGoodsVO = null;
         var _loc2_:Array = new Array();
         var _loc3_:Object = param1.map;
         for each(_loc4_ in this._goods)
         {
            _loc5_ = _loc3_[_loc4_.goodId];
            if(_loc5_.num < _loc4_.num)
            {
               _loc4_.price = _loc5_.price;
               _loc4_.shopId = _loc5_.shopId;
               _loc6_ = _loc4_.num - _loc5_.num;
               _loc7_ = _loc4_.clon();
               _loc7_ = _loc4_.clon();
               _loc7_.num = _loc6_;
               _loc2_.push(_loc7_);
            }
         }
         return _loc2_;
      }
      
      protected function alert2Chongzhi() : void
      {
         var str:String;
         FAlert.okLabel = LanResManager.getLanCommonTextWords("充值");
         str = LanResManager.getLanCommonTextWords("您的元宝不足，请及时充值哦！");
         FAlert.show(str,"",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               GameConfig.chongzhi();
            }
            FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
         });
      }
      
      protected function clearAuto() : void
      {
         this._goods = new Object();
         this._goods_needBuy.length = 0;
         this.upgradeFun = null;
         this.upgradeData = null;
         this._findId = 0;
         this._state = Ready;
      }
      
      protected function stopAutoUpgrade() : void
      {
      }
      
      protected function get state() : int
      {
         return this._state;
      }
      
      public function get isFull() : Boolean
      {
         if(!this.numGoods)
         {
            return false;
         }
         var _loc1_:int = GameInstance.mainCharData.attributeInfo.vipLV;
         var _loc2_:int = GameInstance.mainCharData.attributeInfo.netBagCount;
         if(_loc1_ > 9)
         {
            _loc2_ += 2;
         }
         else if(_loc1_ > 2)
         {
            _loc2_ += 1;
         }
         var _loc3_:GoodsInfo = GameInstance.mainCharData.goodsInfo;
         var _loc4_:int = GoodsInfo.pageCount * _loc2_;
         var _loc5_:int = GameInstance.mainCharData.goodsInfo.getNumInPoint(ItemPositionRange.GOODS_IN_BAG_RANGE);
         _loc5_ = _loc5_ + 3;
         return _loc4_ < _loc5_;
      }
      
      private function get numGoods() : int
      {
         var _loc2_:FindGoodsVO = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this._goods)
         {
            _loc1_++;
         }
         return _loc1_;
      }
   }
}

