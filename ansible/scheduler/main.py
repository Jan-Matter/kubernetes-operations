from apscheduler.schedulers.background import BackgroundScheduler
import time
from ansible.executor.task_queue_manager import TaskQueueManager
from ansible.inventory.manager import InventoryManager
from ansible.parsing.dataloader import DataLoader
from ansible.vars.manager import VariableManager
from ansible.playbook.play import Play
from ansible.plugins.callback import CallbackBase
from ansible import context
from ansible.module_utils.common.collections import ImmutableDict


class AnsibleScheduler:
    
    def __init__():
        pass
    
    

def run_ansible_playbook():
    try:
        result = subprocess.run(['ansible-playbook', '-i', 'inventory.yml', 'your_playbook.yml'], check=True, capture_output=True, text=True)
        print(result.stdout)
    except subprocess.CalledProcessError as e:
        print(f"Error running playbook: {e.output}")

# Create an instance of BackgroundScheduler
scheduler = BackgroundScheduler()

# Schedule the playbook to run every day at 2 AM
scheduler.add_job(run_ansible_playbook, 'cron', hour=2, minute=0)

# Start the scheduler
scheduler.start()

try:
    # Keep the script running
    while True:
        time.sleep(1)
except (KeyboardInterrupt, SystemExit):
    # Shut down the scheduler on exit
    scheduler.shutdown()
