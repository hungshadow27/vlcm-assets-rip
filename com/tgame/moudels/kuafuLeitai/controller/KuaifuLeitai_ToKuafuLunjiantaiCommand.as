package com.tgame.moudels.kuafuLeitai.controller
{
   import com.tgame.PipeConstants;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.kuafuLeitai.view.KuafuLeitai_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class KuaifuLeitai_ToKuafuLunjiantaiCommand extends SimpleCommand
   {
      
      private var _kuafuleitai_Mediator:KuafuLeitai_Mediator;
      
      public function KuaifuLeitai_ToKuafuLunjiantaiCommand()
      {
         super();
      }
      
      private function get kuafuleitai_Mediator() : KuafuLeitai_Mediator
      {
         if(!this._kuafuleitai_Mediator)
         {
            this._kuafuleitai_Mediator = facade.retrieveMediator(KuafuLeitai_Mediator.NAME) as KuafuLeitai_Mediator;
         }
         return this._kuafuleitai_Mediator;
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:int = Number(param1.getBody());
         if(_loc2_ == NpcFunctionType.JINRU_KUAFU_LEITAI)
         {
            PipeManager.sendMsg(PipeConstants.SHOW_KUAFU_LEITAI);
         }
         if(_loc2_ == NpcFunctionType.JINRU_KUAFULEITAI_GUIZHE_WANFA)
         {
            this.kuafuleitai_Mediator.showGuizhe();
         }
      }
   }
}

