#include<stdio.h>
#include<string.h>

int main()
{
    int choice;
    int n;
    int burst[20];
    int wait[20];
    int turn[20];
    int process[20];
    int remaining[20];
    float avg_wait;
    float avg_turn;

    do
    {
        printf("\n====================================");
        printf("\n       CPU SCHEDULING MENU");
        printf("\n====================================");
        printf("\n1. FCFS");
        printf("\n2. SJF");
        printf("\n3. Round Robin");
        printf("\n4. Exit");
        printf("\n====================================");

        printf("\nEnter your choice: ");
        scanf("%d", &choice);

        if (choice == 4)
        {
            printf("\nProgram terminated.\n");
            break;
        }

        printf("\nEnter number of processes: ");
        scanf("%d", &n);
        printf("Enter burst time for each process:\n");
        for (int i = 0; i < n; i++)
        {   process[i] = i + 1;
            printf("P%d: ", i + 1);
            scanf("%d", &burst[i]);
        }
//--------//FCFS
        if (choice == 1){
            avg_wait = 0;
            avg_turn = 0;
            wait[0] = 0;

            for (int i = 1; i < n; i++)
            {
                wait[i] = wait[i - 1] + burst[i - 1];
            }

            for (int i = 0; i < n; i++)
            {
                turn[i] = wait[i] + burst[i];
                avg_wait = avg_wait + wait[i];
                avg_turn = avg_turn + turn[i];
            }
            printf("\nGantt Chart:\n");

            for (int i = 0; i < n; i++)
            {
                printf("| P%d ", process[i]);
            }

            printf("|\n0");
            int time = 0;

            for (int i = 0; i < n; i++)
            {   time = time + burst[i];
                printf("----%d", time);
            }

            printf("\n");
            printf("\nProcess\tBT\tWT\tTAT\n");

            for (int i = 0; i < n; i++)
            {   
                printf("P%d\t%d\t%d\t%d\n",process[i],burst[i],wait[i],turn[i]);
            }

            printf("\nAverage Waiting Time: %.2f",avg_wait / n);
            printf("\nAverage Turnaround Time: %.2f\n",avg_turn / n);
        }
//--------//SJF
        if (choice == 2){
            for (int i = 0; i < n - 1; i++)
            {
                for (int j = i + 1; j < n; j++)
                {
                    if (burst[i] > burst[j])
                    {
                        int temp;
                        temp = burst[i];
                        burst[i] = burst[j];
                        burst[j] = temp;
                        temp = process[i];
                        process[i] = process[j];
                        process[j] = temp;
                    }
                }
            }

            avg_wait = 0;
            avg_turn = 0;
            wait[0] = 0;

            for (int i = 1; i < n; i++)
            {
                wait[i] = wait[i - 1] + burst[i - 1];
            }

            for (int i = 0; i < n; i++)
            {
                turn[i] = wait[i] + burst[i];
                avg_wait = avg_wait + wait[i];
                avg_turn = avg_turn + turn[i];
            }

            printf("\nGantt Chart:\n");

            for (int i = 0; i < n; i++)
            {
                printf("| P%d ", process[i]);
            }

            printf("|\n0");
            int time = 0;

            for (int i = 0; i < n; i++)
            {
                time = time + burst[i];
                printf("    %d", time);
            }

            printf("\n");
            printf("\nProcess\tBT\tWT\tTAT\n");

            for (int i = 0; i < n; i++)
            {
                printf("P%d\t%d\t%d\t%d\n",process[i],burst[i],wait[i],turn[i]);
            }

            printf("\nAverage Waiting Time: %.2f",avg_wait /n);
            printf("\nAverage Turnaround Time: %.2f\n",avg_turn /n);
        }
//--------//Round Robin
        if (choice == 3){
            int quantum;
            int time = 0;
            int completed = 0;
            avg_wait = 0;
            avg_turn = 0;

            printf("\nEnter Time Quantum: ");
            scanf("%d", &quantum);

            for (int i = 0; i < n; i++)
            {
                remaining[i] = burst[i];
                wait[i] = 0;
            }

            printf("\nGantt Chart:\n");

            while (completed < n)
            {
                for (int i = 0; i < n; i++)
                {
                    if (remaining[i] > 0)
                    {
                        printf("| P%d ", process[i]);

                        if (remaining[i] > quantum)
                        {
                            time = time + quantum;
                            remaining[i] = remaining[i] - quantum;
                        }
                        else
                        {
                            time = time + remaining[i];
                            remaining[i] = 0;
                            turn[i] = time;
                            wait[i] = turn[i] - burst[i];
                            completed++;
                        }
                    }
                }
            }
            printf("|\n");
            printf("\nProcess\tBT\tWT\tTAT\n");

            for (int i = 0; i < n; i++)
            {
                avg_wait = avg_wait + wait[i];
                avg_turn = avg_turn + turn[i];
                printf("P%d\t%d\t%d\t%d\n",process[i],burst[i],wait[i],turn[i]);
            }

            printf("\nAverage Waiting Time: %.2f",avg_wait /n);
            printf("\nAverage Turnaround Time: %.2f\n",avg_turn / n);
        }
//------//exit
        else{
            printf("\nInvalid choice! Please try again.\n");
        }
    }while(choice != 4);
    return 0;
}